//
//  VDThemeManager.m
//  objcTheme
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import "VDThemeManager.h"
#import "objcWeakRef.h"
#import "NSObject+VDThemeManager.h"

#if !VDThemeManagerThemeTypeKey
#define VDThemeManagerThemeTypeKey \
[NSString stringWithFormat:@"VDThemeManagerThemeTypeKey"]
#endif

NSString * const VDThemeManagerThemeTypeDidChangeNotification = @"VDThemeManagerThemeTypeDidChangeNotification";
NSString * const VDThemeManagerThemeTypeDidChangeNotificationUserInfoNewThemeTypeKey = @"VDThemeManagerThemeTypeDidChangeNotificationUserInfoNewThemeTypeKey";
NSString * const VDThemeManagerThemeTypeDidChangeNotificationUserInfoOldThemeTypeKey = @"VDThemeManagerThemeTypeDidChangeNotificationUserInfoOldThemeTypeKey";

@interface VDThemeManager ()

- (void)__i__addTarget:(id)target;
- (void)__i__onThemeChange:(NSInteger)newThemeType withOldThemeType:(NSInteger)oldThemeType;

@property (nonatomic, assign) BOOL isThemeChangedBefore;

@property (nonatomic, strong) NSMutableArray *themeTargets;

@end


@implementation VDThemeManager

#pragma mark Public Method
+ (VDThemeManager *)sharedManager {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    } );
    
    return _sharedInstance;
}

+ (void)bindDatasource:(id<VDThemeManagerDatasource>)datasource {
    [[VDThemeManager sharedManager] setDatasource:datasource];
}

+ (void)setupThemeChangeAnimationDuration:(NSTimeInterval)duration {
    [[VDThemeManager sharedManager] setAnimationDuration:duration];
}

+ (void)changeThemeType:(NSInteger)themeType {
    [[VDThemeManager sharedManager] setThemeType:themeType];
}

+ (void)setDefaultThemeType:(NSInteger)defaultThemeType {
    if (![VDThemeManager sharedManager].isThemeChangedBefore) {
        [self changeThemeType:defaultThemeType];
    }
}

+ (NSInteger)currentThemeType {
    return [VDThemeManager sharedManager].themeType;
}

+ (UIColor *)colorForKey:(NSString *)key {
    if ([[VDThemeManager sharedManager].datasource respondsToSelector:@selector(colorForThemeType:withKey:)]) {
        return [[VDThemeManager sharedManager].datasource colorForThemeType:[VDThemeManager sharedManager].themeType withKey:key];
    }
    
    return nil;
}
+ (UIImage *)imageForKey:(NSString *)key {
    if ([[VDThemeManager sharedManager].datasource respondsToSelector:@selector(imageForThemeType:withKey:)]) {
        return [[VDThemeManager sharedManager].datasource imageForThemeType:[VDThemeManager sharedManager].themeType withKey:key];
    }
    
    return nil;
}

+ (UIFont *)fontForKey:(NSString *)key {
    if ([[VDThemeManager sharedManager].datasource respondsToSelector:@selector(fontForThemeType:withKey:)]) {
        return [[VDThemeManager sharedManager].datasource fontForThemeType:[VDThemeManager sharedManager].themeType withKey:key];
    }
    
    return nil;
}

+ (id)attributeForKey:(NSString *)key {
    if ([[VDThemeManager sharedManager].datasource respondsToSelector:@selector(attributeForThemeType:withKey:)]) {
        return [[VDThemeManager sharedManager].datasource attributeForThemeType:[VDThemeManager sharedManager].themeType withKey:key];
    }
    
    return nil;
}

+ (void)setColorForTarget:(id)target selector:(SEL)selector arguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeColor selector:selector arguments:arguments]];
    [[VDThemeManager sharedManager] __i__addTarget:target];
}

+ (void)setImageForTarget:(id)target selector:(SEL)selector arguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeImage selector:selector arguments:arguments]];
    [[VDThemeManager sharedManager] __i__addTarget:target];
}

+ (void)setFontForTarget:(id)target selector:(SEL)selector arguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeFont selector:selector arguments:arguments]];
    [[VDThemeManager sharedManager] __i__addTarget:target];
}

+ (void)setAttributeForTarget:(id)target selector:(SEL)selector arguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeAttribute selector:selector arguments:arguments]];
    [[VDThemeManager sharedManager] __i__addTarget:target];
}

+ (void)removeTarget:(id)target {
    [target vd_clearThemeElements];
}

+ (void)removeTarget:(id)target selector:(SEL)selector arguments:(NSArray *)arguments {
    [target vd_removeThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeRemove selector:selector arguments:arguments]];
}

#pragma mark Properties
- (void)setThemeType:(NSInteger)themeType {
    if (_themeType != themeType) {
        NSInteger oldThemeType = _themeType;
        _themeType = themeType;
        [[NSUserDefaults standardUserDefaults] setObject:@(_themeType) forKey:VDThemeManagerThemeTypeKey];
        [self __i__onThemeChange:_themeType withOldThemeType:oldThemeType];
    }
}

- (NSMutableArray *)themeTargets {
    if (!_themeTargets) {
        _themeTargets = [NSMutableArray new];
    }
    
    return _themeTargets;
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    NSNumber *themeType = [[NSUserDefaults standardUserDefaults] objectForKey:VDThemeManagerThemeTypeKey];
    if (themeType) {
        self.isThemeChangedBefore = YES;
        self.themeType = [themeType integerValue];
    }
    
    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method      
- (void)__i__addTarget:(id)target {
    if (![self.themeTargets containsObject:target]) {
        [self.themeTargets addObject:[target vd_weakRef]];
    }
}

- (void)__i__onThemeChange:(NSInteger)newThemeType withOldThemeType:(NSInteger)oldThemeType {
    for (id target in [self.themeTargets copy]) {
        if ([target respondsToSelector:@selector(vd_onThemeChange:withOldThemeType:)]) {
            [target vd_onThemeChange:newThemeType withOldThemeType:oldThemeType];
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VDThemeManagerThemeTypeDidChangeNotification object:nil userInfo:@{
                                                                                                                            VDThemeManagerThemeTypeDidChangeNotificationUserInfoNewThemeTypeKey:@(newThemeType),
                                                                                                                            VDThemeManagerThemeTypeDidChangeNotificationUserInfoNewThemeTypeKey:@(oldThemeType),
                                                                                                                                  }];
}

@end

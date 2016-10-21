//
//  VDThemeSelectorArgument.m
//  objcTheme
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import "VDThemeSelectorArgument.h"


NSString * const VDThemeSelectorArgumentRemoveThemeKey = @"VDThemeSelectorArgumentRemoveThemeKey";

@interface VDThemeSelectorArgument ()


@end


@implementation VDThemeSelectorArgument

#pragma mark Constructor
+ (instancetype)argumentWithThemeKey:(NSString *)themeKey {
    return [[self alloc] initWithThemeKey:themeKey];
}

- (instancetype)initWithThemeKey:(NSString *)themeKey {
    self = [super init];
    
    _themeKey = themeKey;
    
    return self;
}

#pragma mark Public Method


#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    return self;
}

- (void)dealloc {
    
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[VDThemeSelectorArgument class]]) {
        VDThemeSelectorArgument *argument = object;
        
        BOOL equal = [super isEqual:argument];
        
//        if (equal) {
//            if ([self.themeKey isEqualToString:VDThemeSelectorArgumentRemoveThemeKey]
//                || [argument.themeKey isEqualToString:VDThemeSelectorArgumentRemoveThemeKey]) {
//                equal = YES;
//            }
//            else {
//    //          if set diferent themeKey for the same selector, we must remove pre one to make sure only one element for on selector with same arguments.
//                equal = [self.themeKey isEqualToString:argument.themeKey];
//            }
//        }
        
        return equal;
    }
    
    return [super isEqual:object];
}

#pragma mark Delegates


#pragma mark Private Method

@end

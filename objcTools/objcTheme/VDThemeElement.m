//
//  VDThemeElement.m
//  objcTheme
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import "VDThemeElement.h"


@interface VDThemeElement ()


@end


@implementation VDThemeElement

#pragma mark Constructor

+ (instancetype)elementWithResourceType:(VDThemeElementResourceType)resourceType selector:(SEL)selector arguments:(NSArray *)arguments {
    return [[self alloc] initWithResourceType:resourceType selector:selector arguments:arguments];
}

- (instancetype)initWithResourceType:(VDThemeElementResourceType)resourceType selector:(SEL)selector arguments:(NSArray *)arguments {
    self = [super init];
    
    _resourceType = resourceType;
    _selector = selector;
    self.arguments = arguments;
    
    return self;
}

#pragma mark Public Method

#pragma mark Properties
- (void)setArguments:(NSArray *)arguments {
    for (id argument in arguments) {
        if ([argument isKindOfClass:[VDThemeSelectorArgument class]]
            && [argument themeKey]) {
            self.themeSelectorArgument = argument;
            break;
        }
    }
    
    NSCAssert(self.themeSelectorArgument, @"ThemeManager requires arguments with a VDThemeSelectorArgument argument.");
    
    _arguments = arguments;
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];

    return self;
}

- (void)dealloc {
    
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[VDThemeElement class]]) {
        VDThemeElement *element = object;
        
        BOOL equal = YES;
        
        if (self.resourceType == VDThemeElementResourceTypeRemove
            || element.resourceType == VDThemeElementResourceTypeRemove) {
            equal = YES;
        }
        else {
            equal = self.resourceType == element.resourceType; // comment for easy remove, that the remove element can not set resourceType
        }
        
        if (equal) {
            equal = [NSStringFromSelector(self.selector) isEqualToString:NSStringFromSelector(element.selector)];
        }
        
        if (equal) {
            for (NSInteger i = 0; i < self.arguments.count; i++) {
                equal = [self.arguments[i] isEqual:element.arguments[i]];
                if (!equal) {
                    break;
                }
            }
        }
        
        
        return equal;
    }
    
    return [super isEqual:object];
}


#pragma mark Delegates


#pragma mark Private Method

@end

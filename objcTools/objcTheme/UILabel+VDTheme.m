//
//  UILabel+VDTheme.m
//  objcTemp
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import "UILabel+VDTheme.h"
#import "VDThemeManager.h"

//#import <objc/runtime.h>


@implementation UILabel (VDTheme)

#pragma mark Public Method
- (void)vd_setTextColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self selector:@selector(setTextColor:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setTextColor:) arguments:@[argument1]];
    }
}

- (void)vd_setShadowColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self selector:@selector(setShadowColor:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setShadowColor:) arguments:@[argument1]];
    }
}

- (void)vd_setHighlightedTextColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self selector:@selector(setHighlightedTextColor:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setHighlightedTextColor:) arguments:@[argument1]];
    }
}

#pragma mark Private Method


@end

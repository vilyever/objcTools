//
//  UINavigationBar+VDTheme.m
//  objcTheme
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import "UINavigationBar+VDTheme.h"
#import "VDThemeManager.h"

//#import <objc/runtime.h>


@implementation UINavigationBar (VDTheme)

#pragma mark Public Method
- (void)vd_setBarTintColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self selector:@selector(setBarTintColor:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setBarTintColor:) arguments:@[argument1]];
    }
}

- (void)vd_setBackgroundImageWithThemeKey:(NSString *)key forBarMetrics:(UIBarMetrics)barMetrics {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:barMetrics];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setBackgroundImage:forBarMetrics:) arguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setBackgroundImage:forBarMetrics:) arguments:@[argument1, argument2]];
    }
}

- (void)vd_setBackgroundImageWithThemeKey:(NSString *)key forBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:barPosition];
    VDThemeSelectorArgument *argument3 = [VDThemeSelectorArgument argumentWithIntegerArgument:barMetrics];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setBackgroundImage:forBarPosition:barMetrics:) arguments:@[argument1, argument2, argument3]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setBackgroundImage:forBarPosition:barMetrics:) arguments:@[argument1, argument2, argument3]];
    }
}

- (void)vd_setBackIndicatorImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setBackIndicatorImage:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setBackIndicatorImage:) arguments:@[argument1]];
    }
}

- (void)vd_setBackIndicatorTransitionMaskImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setBackIndicatorTransitionMaskImage:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setBackIndicatorTransitionMaskImage:) arguments:@[argument1]];
    }
}

- (void)vd_setShadowImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setShadowImage:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setShadowImage:) arguments:@[argument1]];
    }
}

#pragma mark Private Method


@end

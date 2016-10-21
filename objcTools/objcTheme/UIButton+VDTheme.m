//
//  UIButton+VDTheme.m
//  objcTheme
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import "UIButton+VDTheme.h"
#import "VDThemeManager.h"

//#import <objc/runtime.h>


@implementation UIButton (VDTheme)

#pragma mark Public Method
- (void)vd_setTitleColorWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setColorForTarget:self selector:@selector(setTitleColor:forState:) arguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setTitleColor:forState:) arguments:@[argument1, argument2]];
    }
}

- (void)vd_setTitleShadowColorWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setColorForTarget:self selector:@selector(setTitleShadowColor:forState:) arguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setTitleShadowColor:forState:) arguments:@[argument1, argument2]];
    }
    
}

- (void)vd_setImageWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setImage:forState:) arguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setImage:forState:) arguments:@[argument1, argument2]];
    }
}

- (void)vd_setBackgroundImageWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setBackgroundImage:forState:) arguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setBackgroundImage:forState:) arguments:@[argument1, argument2]];
    }
}

#pragma mark Private Method


@end

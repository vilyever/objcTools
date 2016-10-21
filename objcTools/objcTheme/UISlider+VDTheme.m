//
//  UISlider+VDTheme.m
//  objcTheme
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import "UISlider+VDTheme.h"
#import "VDThemeManager.h"

//#import <objc/runtime.h>


@implementation UISlider (VDTheme)

#pragma mark Public Method
- (void)vd_setThumbTintColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self selector:@selector(setThumbTintColor:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setThumbTintColor:) arguments:@[argument1]];
    }
}

- (void)vd_setMinimumTrackTintColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self selector:@selector(setMinimumTrackTintColor:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setMinimumTrackTintColor:) arguments:@[argument1]];
    }
}

- (void)vd_setMaximumTrackTintColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self selector:@selector(setMaximumTrackTintColor:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setMaximumTrackTintColor:) arguments:@[argument1]];
    }
}

- (void)vd_setMinimumValueImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setMinimumValueImage:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setMinimumValueImage:) arguments:@[argument1]];
    }
}

- (void)vd_setMaximumValueImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setMaximumValueImage:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setMaximumValueImage:) arguments:@[argument1]];
    }
}

- (void)vd_setThumbImageWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setThumbImage:forState:) arguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setThumbImage:forState:) arguments:@[argument1, argument2]];
    }
}

- (void)vd_setMinimumTrackImageWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setMinimumTrackImage:forState:) arguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setMinimumTrackImage:forState:) arguments:@[argument1, argument2]];
    }
}

- (void)vd_setMaximumTrackImageWithThemeKey:(NSString *)key forState:(UIControlState)state {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    VDThemeSelectorArgument *argument2 = [VDThemeSelectorArgument argumentWithIntegerArgument:state];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setMaximumTrackImage:forState:) arguments:@[argument1, argument2]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setMaximumTrackImage:forState:) arguments:@[argument1, argument2]];
    }
}

#pragma mark Private Method


@end

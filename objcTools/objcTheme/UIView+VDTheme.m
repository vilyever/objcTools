//
//  UIView+VDTheme.m
//  objcTheme
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import "UIView+VDTheme.h"
#import "VDThemeManager.h"

//#import <objc/runtime.h>


@implementation UIView (VDTheme)

#pragma mark Public Method
- (void)vd_setBackgroundColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self selector:@selector(setBackgroundColor:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setBackgroundColor:) arguments:@[argument1]];
    }
}

- (void)vd_setTintColorWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setColorForTarget:self selector:@selector(setTintColor:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setTintColor:) arguments:@[argument1]];
    }
}

#pragma mark Private Method


@end

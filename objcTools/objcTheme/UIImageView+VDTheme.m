//
//  UIImageView+VDTheme.m
//  objcTheme
//
//  Created by Deng on 16/7/14.
//  Copyright © Deng. All rights reserved.
//

#import "UIImageView+VDTheme.h"
#import "VDThemeManager.h"

//#import <objc/runtime.h>


@implementation UIImageView (VDTheme)

#pragma mark Public Method
- (void)vd_setImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setImage:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setImage:) arguments:@[argument1]];
    }
}

- (void)vd_setHighlightedImageImageWithThemeKey:(NSString *)key {
    VDThemeSelectorArgument *argument1 = [VDThemeSelectorArgument argumentWithThemeKey:key];
    
    if (key) {
        [VDThemeManager setImageForTarget:self selector:@selector(setHighlightedImage:) arguments:@[argument1]];
    }
    else {
        [VDThemeManager removeTarget:self selector:@selector(setHighlightedImage:) arguments:@[argument1]];
    }
}

#pragma mark Private Method


@end

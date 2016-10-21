//
//  UIColor+VDChange.m
//  objcColor
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIColor+VDChange.h"

//#import <objc/runtime.h>
//@import objcTemp;


@implementation UIColor (VDChange)

#pragma mark Constructor


#pragma mark Public Method
- (UIColor *)vd_changeAlpha:(CGFloat)alpha {
    CGFloat red = 0.0f;
    CGFloat green = 0.0f;
    CGFloat blue = 0.0f;
    
    [self getRed:&red green:&green blue:&blue alpha:nil];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (UIColor *)vd_changeRed:(CGFloat)red {
    CGFloat green = 0.0f;
    CGFloat blue = 0.0f;
    CGFloat alpha = 0.0f;
    
    [self getRed:nil green:&green blue:&blue alpha:&alpha];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (UIColor *)vd_changeGreen:(CGFloat)green {
    CGFloat red = 0.0f;
    CGFloat blue = 0.0f;
    CGFloat alpha = 0.0f;
    
    [self getRed:&red green:nil blue:&blue alpha:&alpha];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (UIColor *)vd_changeBlue:(CGFloat)blue {
    CGFloat red = 0.0f;
    CGFloat green = 0.0f;
    CGFloat alpha = 0.0f;
    
    [self getRed:&red green:&green blue:nil alpha:&alpha];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

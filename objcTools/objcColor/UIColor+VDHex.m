//
//  UIColor+VDHex.m
//  objcColor
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIColor+VDHex.h"

//#import <objc/runtime.h>
//@import objcTemp;


@implementation UIColor (VDHex)

#pragma mark Constructor
+ (UIColor *)vd_colorWithHexString:(NSString *)hexString {
    if (hexString.length != 7) {
        return nil;
    }
    
    unsigned red = 0.0f;
    unsigned green = 0.0f;
    unsigned blue = 0.0f;
    unsigned alpha = 1.0f;
    
    [ [NSScanner scannerWithString:[NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(1, 2) ] ] ] scanHexInt:&red];
    [ [NSScanner scannerWithString:[NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(3, 2) ] ] ] scanHexInt:&green];
    [ [NSScanner scannerWithString:[NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(5, 2) ] ] ] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)red / 255.0 green:(float)green / 255.0 blue:(float)blue / 255.0 alpha:alpha];
}

+ (UIColor *)vd_colorWithAlphaHexString:(NSString *)hexString {
    if (hexString.length != 9) {
        return nil;
    }
    
    unsigned red = 0.0f;
    unsigned green = 0.0f;
    unsigned blue = 0.0f;
    unsigned alpha = 1.0f;
    
    [ [NSScanner scannerWithString:[NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(1, 2) ] ] ] scanHexInt:&alpha];
    [ [NSScanner scannerWithString:[NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(3, 2) ] ] ] scanHexInt:&red];
    [ [NSScanner scannerWithString:[NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(5, 2) ] ] ] scanHexInt:&green];
    [ [NSScanner scannerWithString:[NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(7, 2) ] ] ] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)red / 255.0 green:(float)green / 255.0 blue:(float)blue / 255.0 alpha:alpha];
}

+ (UIColor *)vd_colorWithHexValue:(unsigned)hexValue {
    unsigned red = 0.0f;
    unsigned green = 0.0f;
    unsigned blue = 0.0f;
    unsigned alpha = 1.0f;
    
    red = (hexValue & 0xFF0000) >> 16;
    green = (hexValue & 0xFF00) >> 8;
    blue = hexValue & 0xFF;
    
    return [UIColor colorWithRed:(float) red / 255.0 green:(float) green / 255.0 blue:(float) blue / 255.0 alpha:alpha];
}

+ (UIColor *)vd_colorWithAlphaHexValue:(unsigned int)hexValue {
    unsigned red = 0.0f;
    unsigned green = 0.0f;
    unsigned blue = 0.0f;
    unsigned alpha = 1.0f;
    
    alpha = (hexValue & 0xFF000000) >> 24;
    red = (hexValue & 0xFF0000) >> 16;
    green = (hexValue & 0xFF00) >> 8;
    blue = hexValue & 0xFF;
    
    return [UIColor colorWithRed:(float) red / 255.0 green:(float) green / 255.0 blue:(float) blue / 255.0 alpha:(float) alpha / 255.0];
}

#pragma mark Public Method
- (NSString *)vd_hexString {
    CGFloat red = 0.0f;
    CGFloat green = 0.0f;
    CGFloat blue = 0.0f;
    CGFloat alpha = 0.0f;
    
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    return [NSString stringWithFormat:@"#%02X%02X%02X", (unsigned) (red * 255), (unsigned) (green * 255), (unsigned) (blue * 255)];
}

- (NSString *)vd_hexStringWithAlpha {
    CGFloat red = 0.0f;
    CGFloat green = 0.0f;
    CGFloat blue = 0.0f;
    CGFloat alpha = 0.0f;
    
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    return [NSString stringWithFormat:@"#%02X%02X%02X%02X", (unsigned) (alpha * 255), (unsigned) (red * 255), (unsigned) (green * 255), (unsigned) (blue * 255)];
}

- (unsigned)vd_hexValue {
    CGFloat red = 0.0f;
    CGFloat green = 0.0f;
    CGFloat blue = 0.0f;
    CGFloat alpha = 0.0f;
    
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    unsigned hexValue = 0x00;
    
    hexValue = hexValue | (unsigned) (blue * 255);
    hexValue = hexValue | ((unsigned) (green * 255) << 8);
    hexValue = hexValue | ((unsigned) (red * 255) << 16);
    
    return hexValue;
}

- (unsigned)vd_hexValueWithAlpha {
    CGFloat red = 0.0f;
    CGFloat green = 0.0f;
    CGFloat blue = 0.0f;
    CGFloat alpha = 0.0f;
    
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    unsigned hexValue = 0x00;
    
    hexValue = hexValue | (unsigned) (blue * 255);
    hexValue = hexValue | ((unsigned) (green * 255) << 8);
    hexValue = hexValue | ((unsigned) (red * 255) << 16);
    hexValue = hexValue | ((unsigned) (alpha * 255) << 24);
    
    return hexValue;
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

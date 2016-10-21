//
//  UIColor+VDHex.h
//  objcColor
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (VDHex)

#pragma mark Constructor
+ (UIColor *)vd_colorWithHexString:(NSString *)hexString;
+ (UIColor *)vd_colorWithAlphaHexString:(NSString *)hexString;

+ (UIColor *)vd_colorWithHexValue:(unsigned)hexValue;
+ (UIColor *)vd_colorWithAlphaHexValue:(unsigned)hexValue;

#pragma mark Public Method
- (NSString *)vd_hexString;
- (NSString *)vd_hexStringWithAlpha;

- (unsigned)vd_hexValue;
- (unsigned)vd_hexValueWithAlpha;

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

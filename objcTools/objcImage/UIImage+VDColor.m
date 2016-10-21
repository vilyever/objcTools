//
//  UIImage+VDColor.m
//  objcImage
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIImage+VDColor.h"

//#import <objc/runtime.h>


@implementation UIImage (VDColor)

#pragma mark Constructor
+ (UIImage *)vd_imageWithColor:(UIColor *)color {
    return [self vd_imageWithColor:color withImageSize:CGSizeMake(1.0f, 1.0f) ];
}

+ (UIImage *)vd_imageWithColor:(UIColor *)color withImageSize:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = nil;
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)vd_imageWithColor:(UIColor *)color withImageSize:(CGSize)size withCornerRadius:(float)cornerRadius {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius) ];
    
    [path closePath];
    [path fill];
    
    UIImage *image = nil;
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark Public Method


#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

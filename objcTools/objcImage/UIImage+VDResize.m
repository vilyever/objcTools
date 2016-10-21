//
//  UIImage+VDResize.m
//  objcImage
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIImage+VDResize.h"

//#import <objc/runtime.h>


@implementation UIImage (VDResize)

#pragma mark Constructor


#pragma mark Public Method
+ (UIImage *)vd_resizeImage:(UIImage *)image withProportion:(CGFloat)proportion {
    if (proportion <= 0.0f) {
        return nil;
    }
    
    CGImageRef imageRef = [image CGImage];
    CGFloat imageWidth = CGImageGetWidth(imageRef) * proportion;
    CGFloat imageHeight = CGImageGetHeight(imageRef) * proportion;
    
    return [self vd_resizeImage:image withNewSize:CGSizeMake(imageWidth, imageHeight)];
}

+ (UIImage *)vd_resizeImage:(UIImage *)image withNewSize:(CGSize)newSize {
    CGRect bounds = CGRectMake(0.0f, 0.0f, newSize.width, newSize.height);
    
    UIGraphicsBeginImageContextWithOptions(bounds.size, NO, 0.0f);
    [image drawInRect:bounds];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resizedImage;
}

- (UIImage *)vd_resizeWithProportion:(CGFloat)proportion {
    return [[self class] vd_resizeImage:self withProportion:proportion];
}

- (UIImage *)vd_resizeWithNewSize:(CGSize)newSize {
    return [[self class] vd_resizeImage:self withNewSize:newSize];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

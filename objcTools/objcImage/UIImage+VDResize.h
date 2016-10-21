//
//  UIImage+VDResize.h
//  objcImage
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (VDResize)

#pragma mark Constructor


#pragma mark Public Method
+ (UIImage *)vd_resizeImage:(UIImage *)image withProportion:(CGFloat)proportion;
+ (UIImage *)vd_resizeImage:(UIImage *)image withNewSize:(CGSize)newSize;

- (UIImage *)vd_resizeWithProportion:(CGFloat)proportion;
- (UIImage *)vd_resizeWithNewSize:(CGSize)newSize;

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

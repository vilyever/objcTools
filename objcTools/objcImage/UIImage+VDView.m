//
//  UIImage+VDView.m
//  objcImage
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIImage+VDView.h"

//#import <objc/runtime.h>


@implementation UIImage (VDView)

#pragma mark Constructor
+ (UIImage *)vd_imageWithView:(UIView *)view {
    UIGraphicsBeginImageContext(view.frame.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext() ];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark Public Method


#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

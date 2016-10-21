//
//  UIImage+VDFile.m
//  objcImage
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIImage+VDFile.h"

//#import <objc/runtime.h>


@implementation UIImage (VDFile)

#pragma mark Constructor
+ (UIImage *)vd_loadImageWithFilePath:(NSString *)filePath withType:(NSString *)type {
    return [UIImage imageWithContentsOfFile:[ [NSBundle mainBundle] pathForResource:filePath ofType:type] ];
}

#pragma mark Public Method


#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

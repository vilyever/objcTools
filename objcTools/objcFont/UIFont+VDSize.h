//
//  UIFont+VDSize.h
//  objcFont
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIFont (VDSize)

#pragma mark Constructor


#pragma mark Public Method
- (CGSize)vd_sizeWithString:(NSString *)string withMaxWidth:(float)maxWidth;
- (CGSize)vd_sizeWithString:(NSString *)string withMaxWidth:(float)maxWidth withLineBreakMode:(NSLineBreakMode)lineBreakMode;

- (UIFont *)vd_resizeFontWithString:(NSString *)string withMaxSize:(CGSize)maxSize;

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

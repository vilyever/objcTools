//
//  CALayer+VDShadow.m
//  objcLayer
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "CALayer+VDShadow.h"
#import <UIKit/UIKit.h>
//#import <objc/runtime.h>


@implementation CALayer (VDShadow)

#pragma mark Constructor


#pragma mark Public Method
- (void)vd_addShadow {
    self.shadowColor = [UIColor blackColor].CGColor;
    self.shadowOffset = CGSizeMake(0.0f, 3.0f);
    self.shadowOpacity = 0.6f;
}

- (void)vd_clearShadow {
    self.shadowColor = [UIColor clearColor].CGColor;
    self.shadowOffset = CGSizeZero;
    self.shadowOpacity = 0.0f;
}


#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

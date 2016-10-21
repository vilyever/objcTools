//
//  UISlider+VDValue.m
//  objcSlider
//
//  Created by Deng on 16/8/8.
//  Copyright © Deng. All rights reserved.
//

#import "UISlider+VDValue.h"

//#import <objc/runtime.h>


@implementation UISlider (VDValue)

#pragma mark Constructor


#pragma mark Public Method
- (void)vd_setValueWithValueChangedAction:(float)value {
    [self vd_setValueWithValueChangedAction:value animated:NO];
}

- (void)vd_setValueWithValueChangedAction:(float)value animated:(BOOL)animated {
    [self setValue:value animated:animated];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

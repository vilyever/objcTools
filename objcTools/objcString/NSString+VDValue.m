//
//  NSString+VDValue.m
//  objcString
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSString+VDValue.h"

//#import <objc/runtime.h>


@implementation NSString (VDValue)

#pragma mark Constructor


#pragma mark Public Method
- (BOOL)vd_boolValue {
    return [self vd_boolValue:nil];
}

- (BOOL)vd_boolValue:(NSString *)yesValue {
    if (!yesValue) {
        yesValue = @"YES";
    }
    
    return [self caseInsensitiveCompare:yesValue] == NSOrderedSame;
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

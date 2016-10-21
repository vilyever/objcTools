//
//  NSString+VDRegex.m
//  objcString
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSString+VDRegex.h"

//#import <objc/runtime.h>


@implementation NSString (VDRegex)

#pragma mark Constructor


#pragma mark Public Method
- (BOOL)vd_isRegexMatched:(NSString *)regex {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

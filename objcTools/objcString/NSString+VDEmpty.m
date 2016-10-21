//
//  NSString+VDEmpty.m
//  objcString
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSString+VDEmpty.h"

//#import <objc/runtime.h>


@implementation NSString (VDEmpty)

#pragma mark Constructor


#pragma mark Public Method
- (BOOL)vd_isEmptyIncludeSpaces {
    if (self.length == 0) {
        return YES;
    }
    
    NSString *regex = @"^\\s*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

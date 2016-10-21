//
//  NSString+Change.m
//  objcString
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSString+Change.h"

//#import <objc/runtime.h>


@implementation NSString (Change)

#pragma mark Constructor


#pragma mark Public Method
- (NSString *)vd_cleanExcessSpace {
    NSCharacterSet *whiteSpaces = [NSCharacterSet whitespaceCharacterSet];
    NSPredicate *noEmptyString = [NSPredicate predicateWithFormat:@"SELF != ''"];
    
    NSArray *parts = [self componentsSeparatedByCharactersInSet:whiteSpaces];
    NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyString];
    return [filteredArray componentsJoinedByString:@" "];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

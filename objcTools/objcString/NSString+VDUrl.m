//
//  NSString+VDUrl.m
//  objcString
//
//  Created by Deng on 16/8/17.
//  Copyright © Deng. All rights reserved.
//

#import "NSString+VDUrl.h"

//#import <objc/runtime.h>


@implementation NSString (VDUrl)

#pragma mark Constructor


#pragma mark Public Method
- (NSString *)vd_utf8EncondingUrl {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

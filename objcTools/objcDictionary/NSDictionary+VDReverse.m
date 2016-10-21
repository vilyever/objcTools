//
//  NSDictionary+VDReverse.m
//  objcDictionary
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSDictionary+VDReverse.h"

//#import <objc/runtime.h>


@implementation NSDictionary (VDReverse)

#pragma mark Constructor


#pragma mark Public Method
- (NSDictionary *)vd_reverseKeyObject {
    NSMutableDictionary *resultDictionary = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [resultDictionary setObject:key forKey:obj];
    } ];
    
    return [resultDictionary copy];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

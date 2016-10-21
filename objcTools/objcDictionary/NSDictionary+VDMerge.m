//
//  NSDictionary+VDMerge.m
//  objcDictionary
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSDictionary+VDMerge.h"

//#import <objc/runtime.h>


@implementation NSDictionary (VDMerge)

#pragma mark Constructor
+ (NSDictionary *)vd_dictionaryWithDictionary:(NSDictionary *)dictionary mergeWithDictionary:(NSDictionary *)overrideDictionary {
    NSMutableDictionary *resultDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    
    [overrideDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [resultDictionary setObject:obj forKey:key];
    }];
    
    return [resultDictionary copy];
}

#pragma mark Public Method
- (NSDictionary *)vd_mergeWithDictionary:(NSDictionary *)overrideDictionary {
    return [[self class] vd_dictionaryWithDictionary:self mergeWithDictionary:overrideDictionary];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

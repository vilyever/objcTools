//
//  NSDictionary+VDMerge.h
//  objcDictionary
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (VDMerge)

#pragma mark Constructor
+ (NSDictionary *)vd_dictionaryWithDictionary:(NSDictionary *)dictionary mergeWithDictionary:(NSDictionary *)overrideDictionary;

#pragma mark Public Method
- (NSDictionary *)vd_mergeWithDictionary:(NSDictionary *)overrideDictionary;

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

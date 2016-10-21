//
//  VDKVOChange.h
//  objcKVO
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@class VDKVOChange;


@interface VDKVOChange : NSObject

#pragma mark Constructor
+ (instancetype)changeWithDictionary:(NSDictionary *)changeDictionary;
- (instancetype)initWithDictionary:(NSDictionary *)changeDictionary;

#pragma mark Public Method
- (id)newValue;
- (id)oldValue;

#pragma mark Properties
@property (nonatomic, strong) NSDictionary *changeDictionary;

#pragma mark Protected Method


#pragma mark Private Method


@end

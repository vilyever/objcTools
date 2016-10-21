//
//  VDKVOChange.m
//  objcKVO
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "VDKVOChange.h"


@interface VDKVOChange ()

- (void)__i__initVDKVOChange;

@end


@implementation VDKVOChange

#pragma mark Constructor
+ (instancetype)changeWithDictionary:(NSDictionary *)changeDictionary {
    return [[self alloc] initWithDictionary:changeDictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)changeDictionary {
    self = [super init];
    
    _changeDictionary = changeDictionary;
    
    return self;
}

#pragma mark Public Method
- (id)newValue {
    return [self.changeDictionary objectForKey:NSKeyValueChangeNewKey];
}

- (id)oldValue {
    return [self.changeDictionary objectForKey:NSKeyValueChangeOldKey];
}

#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    // Initialization code
    [self __i__initVDKVOChange];

    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Protected Method


#pragma mark Private Method
- (void)__i__initVDKVOChange {
    
}

@end

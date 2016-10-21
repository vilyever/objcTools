//
//  NSObject+VDSharedInstance.h
//  objcObject
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (VDSharedInstance)

#pragma mark Constructor


#pragma mark Public Method
+ (instancetype)vd_sharedInstance;
+ (instancetype)vd_sharedInstance:(id(^)(void))initAction;
+ (void)vd_destroySharedInstance;

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

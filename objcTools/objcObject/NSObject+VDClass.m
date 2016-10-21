//
//  NSObject+VDClass.m
//  objcObject
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDClass.h"

//#import <objc/runtime.h>


@implementation NSObject (VDClass)

#pragma mark Constructor


#pragma mark Public Method
+ (NSString *)vd_className {
    return NSStringFromClass(self);
}

- (NSString *)vd_className {
    return [[self class] vd_className];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

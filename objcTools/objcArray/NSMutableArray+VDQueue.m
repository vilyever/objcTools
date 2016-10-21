//
//  NSMutableArray+VDQueue.m
//  objcArray
//
//  Created by Deng on 16/8/8.
//  Copyright © Deng. All rights reserved.
//

#import "NSMutableArray+VDQueue.h"

//#import <objc/runtime.h>


@implementation NSMutableArray (VDQueue)

#pragma mark Constructor


#pragma mark Public Method
- (void)vd_queuePush:(id)obj {
    @synchronized (self) {
        [self addObject:obj];
    }
}

- (id)vd_queuePop {
    @synchronized (self) {
        if (self.count == 0) {
            return nil;
        }
        
        id obj = [self objectAtIndex:0];
        [self removeObjectAtIndex:0];
        return obj;
    }
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

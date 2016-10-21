//
//  NSMutableArray+VDStack.m
//  objcArray
//
//  Created by Deng on 16/8/8.
//  Copyright © Deng. All rights reserved.
//

#import "NSMutableArray+VDStack.h"

//#import <objc/runtime.h>


@implementation NSMutableArray (VDStack)

#pragma mark Constructor


#pragma mark Public Method
- (void)vd_stackPush:(id)obj {
    @synchronized (self) {
        [self addObject:obj];
    }
}

- (id)vd_stackPop {
    @synchronized (self) {
        if (self.count == 0) {
            return nil;
        }
        
        id obj = [self lastObject];
        [self removeLastObject];
        return obj;
    }
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

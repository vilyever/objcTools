//
//  NSObject+VDPerform.m
//  objcObject
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDPerform.h"

//#import <objc/runtime.h>


@implementation NSObject (VDPerform)

#pragma mark Constructor


#pragma mark Public Method
- (void)vd_performSelector:(SEL)aSelector {
    if ([self respondsToSelector:aSelector]) {
        ( (void (*)(id, SEL) )[self methodForSelector:aSelector] )(self, aSelector);
    }
}

- (void)vd_performSelector:(SEL)aSelector withObject:(id)object {
    if ([self respondsToSelector:aSelector]) {
        ( (void (*)(id, SEL, id) )[self methodForSelector:aSelector] )(self, aSelector, object);
    }
}

- (void)vd_performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 {
    if ([self respondsToSelector:aSelector]) {
        ( (void (*)(id, SEL, id, id) )[self methodForSelector:aSelector] )(self, aSelector, object1, object2);
    }
}

- (void)vd_performSelector:(SEL)aSelector withInteger:(NSInteger)integer {
    if ([self respondsToSelector:aSelector]) {
        ( (void (*)(id, SEL, NSInteger) )[self methodForSelector:aSelector] )(self, aSelector, integer);
    }
}

- (void)vd_performActionDelay:(float)second action:(void (^)(void))action {
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * second);
    dispatch_after(delay, dispatch_get_main_queue(), [action copy] );
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

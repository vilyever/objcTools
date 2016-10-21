//
//  NSObject+VDPerform.h
//  objcObject
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (VDPerform)

#pragma mark Constructor


#pragma mark Public Method
- (void)vd_performSelector:(SEL)aSelector;
- (void)vd_performSelector:(SEL)aSelector withObject:(id)object;
- (void)vd_performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;
- (void)vd_performSelector:(SEL)aSelector withInteger:(NSInteger)integer;

- (void)vd_performActionDelay:(float)second action:(void (^)(void) )action;

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

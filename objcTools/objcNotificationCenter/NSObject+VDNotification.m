//
//  NSObject+VDNotification.m
//  objcNotificationCenter
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDNotification.h"

#import <objc/runtime.h>


@implementation NSObject (VDNotification)

#pragma mark Constructor


#pragma mark Public Method
- (VDNotificationElement *)vd_observeNotification:(NSString *)notificationName object:(id)object action:(void (^)(VDNotificationElement *, NSNotification *))action {
    VDNotificationElement *element = [[VDNotificationElement alloc] initWithTarget:self name:notificationName object:object notificationBlock:action];
    
    [self.vd_notificationElementArray addObject:element];
    
    return element;
}

#pragma mark Properties
- (NSMutableArray *)vd_notificationElementArray {
    NSMutableArray *array = objc_getAssociatedObject(self, @selector(vd_notificationElementArray));
    if (!array) {
        array = [NSMutableArray new];
        objc_setAssociatedObject(self, @selector(vd_notificationElementArray), array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSMutableArray *disposedElementArray = [NSMutableArray new];
    for (VDNotificationElement *element in array) {
        if (element.isDisposed) {
            [disposedElementArray addObject:element];
        }
    }
    
    [array removeObjectsInArray:disposedElementArray];
    
    return array;
}

#pragma mark Protected Method


#pragma mark Private Method


@end

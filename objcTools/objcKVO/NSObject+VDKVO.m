//
//  NSObject+VDKVO.m
//  objcKVO
//
//  Created by Deng on 16/7/25.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDKVO.h"

#import <objc/runtime.h>


@implementation NSObject (VDKVO)

#pragma mark Public Method
- (VDKVOElement *)vd_kvoWithTarget:(id)target keyPath:(NSString *)keyPath action:(void (^)(VDKVOElement *, VDKVOChange *))action {
    VDKVOElement *element = [[VDKVOElement alloc] initWithTarget:target keyPath:keyPath action:action];
    
    [self.vd_kvoElementArray addObject:element];
    
    return element;
}

#pragma mark Properties
- (NSMutableArray *)vd_kvoElementArray {
    NSMutableArray *array = objc_getAssociatedObject(self, @selector(vd_kvoElementArray));
    if (!array) {
        array = [NSMutableArray new];
        objc_setAssociatedObject(self, @selector(vd_kvoElementArray), array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSMutableArray *disposedElementArray = [NSMutableArray new];
    for (VDKVOElement *element in array) {
        if (element.isDisposed) {
            [disposedElementArray addObject:element];
        }
    }
    
    [array removeObjectsInArray:disposedElementArray];
    
    return array;
}

#pragma mark Private Method


@end

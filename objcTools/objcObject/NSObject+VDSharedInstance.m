//
//  NSObject+VDSharedInstance.m
//  objcObject
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDSharedInstance.h"

//#import <objc/runtime.h>


@implementation NSObject (VDSharedInstance)

#pragma mark Constructor


#pragma mark Public Method
static NSMutableDictionary *SharedInstanceDictionary = nil;
+ (instancetype)vd_sharedInstance {
    return [self vd_sharedInstance:nil];
}

+ (instancetype)vd_sharedInstance:(id (^)(void))initAction {
    NSObject *sharedInstance = nil;
    
    @synchronized(self) {
        NSString *instanceClass = NSStringFromClass(self);
        sharedInstance = [SharedInstanceDictionary objectForKey:instanceClass];
        if (!sharedInstance) {
            if (initAction) {
                sharedInstance = initAction();
            } else {
                sharedInstance = [[self alloc] init];
            }
            if (!SharedInstanceDictionary) {
                static dispatch_once_t onceToken;
                dispatch_once(&onceToken, ^{
                    SharedInstanceDictionary = [NSMutableDictionary dictionary];
                } );
            }
            [SharedInstanceDictionary setObject:sharedInstance forKey:instanceClass];
        }
    }
    
    return sharedInstance;
}

+ (void)vd_destroySharedInstance {
    [SharedInstanceDictionary removeObjectForKey:NSStringFromClass(self)];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

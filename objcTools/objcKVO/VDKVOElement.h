//
//  VDKVOElement.h
//  objcKVO
//
//  Created by Deng on 16/7/25.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VDKVOChange.h"

@class VDKVOElement;


@interface VDKVOElement : NSObject

#pragma mark Public Method
- (instancetype)initWithTarget:(id)target keyPath:(NSString *)keyPath action:(void(^)(VDKVOElement *element, VDKVOChange *change))action;
- (void)dispose;

#pragma mark Properties
@property (nonatomic, weak) id target;
@property (nonatomic, copy) NSString *keyPath;
@property (nonatomic, strong) void(^kvoAction)(VDKVOElement *element, VDKVOChange *change);

@property (nonatomic, assign, readonly) BOOL isDisposed;

#pragma mark Private Method


@end

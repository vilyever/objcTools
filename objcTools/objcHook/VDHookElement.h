//
//  VDHookElement.h
//  objcHook
//
//  Created by Deng on 16/6/17.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDHookInvocationInfo.h"


@class VDHookElement;


@interface VDHookElement : NSObject

#pragma mark Public Method
+ (instancetype)elementWithTarget:(id)target selector:(SEL)selector block:(void (^)(VDHookElement *element, VDHookInvocationInfo *info))block;
+ (instancetype)elementWithTarget:(id)target selector:(SEL)selector block:(void (^)(VDHookElement *element, VDHookInvocationInfo *info))block autoRemove:(BOOL)autoRemove;
- (void)invokeBlock:(VDHookInvocationInfo *)invocationInfo;

- (void)dispose;

#pragma mark Properties
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) void(^block)(VDHookElement *element, VDHookInvocationInfo *info);
@property (nonatomic, assign, readonly) BOOL autoRemove;
@property (nonatomic, assign, readonly) BOOL isDisposed;

@end

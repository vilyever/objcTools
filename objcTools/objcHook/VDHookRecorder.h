//
//  VDHookRecorder.h
//  objcHook
//
//  Created by Deng on 16/6/16.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDHookElement.h"
#import "VDHookInvocationInfo.h"


@class VDHookRecorder;


@interface VDHookRecorder : NSObject

#pragma mark Public Method
+ (VDHookRecorder *)recorderForTarget:(id)target selector:(SEL)selector;

- (void)addBeforeElement:(VDHookElement *)element;
- (void)addInsteadElement:(VDHookElement *)element;
- (void)addAfterElement:(VDHookElement *)element;
- (void)removeElement:(VDHookElement *)element;
- (BOOL)hasElement;

- (void)invokeBeforeElements:(VDHookInvocationInfo *)invocationInfo;
- (void)invokeInsteadElements:(VDHookInvocationInfo *)invocationInfo;
- (void)invokeAfterElements:(VDHookInvocationInfo *)invocationInfo;

#pragma mark Properties
@property (nonatomic, strong) NSMutableArray *beforeElements;
@property (nonatomic, strong) NSMutableArray *insteadElements;
@property (nonatomic, strong) NSMutableArray *afterElements;

#pragma mark Private Method
- (void)internalRemoveDisposedElements:(NSMutableArray *)elements;
- (void)internalInvokeElements:(NSMutableArray *)elements invocationInfo:(VDHookInvocationInfo *)invocationInfo;

@end

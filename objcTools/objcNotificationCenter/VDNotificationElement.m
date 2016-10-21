//
//  VDNotificationElement.m
//  objcNotificationCenter
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "VDNotificationElement.h"
#import "objcHook.h"
#import "objcBlock.h"

@interface VDNotificationElement ()

- (void)__i__initVDNotificationElement;
- (void)__i__onNofitication:(NSNotification *)notification;

@property (nonatomic, assign, readwrite) BOOL isDisposed;
@property (nonatomic, strong) VDHookElement *hookedDeallocElement;

@end


@implementation VDNotificationElement

#pragma mark Constructor
- (instancetype)initWithTarget:(id)target name:(NSString *)notificationName object:(id)object notificationBlock:(void (^)(VDNotificationElement *, NSNotification *))notificationBlock {
    self = [super init];
    _target = target;
    _notificationName = [notificationName copy];
    _object = object;
    _notificationBlock = notificationBlock;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__onNofitication:) name:_notificationName object:_object];
    VDWeakifySelf;
    self.hookedDeallocElement = [_target vd_hookSelector:VDHookDeallocSelector beforeBlock:^(VDHookElement *element, VDHookInvocationInfo *info) {
        VDStrongifySelf;
        [self dispose];
    }];
    
    return self;
}

#pragma mark Public Method
- (void)dispose {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.hookedDeallocElement dispose];
    self.isDisposed = YES;
}

#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    // Initialization code
    [self __i__initVDNotificationElement];

    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Protected Method


#pragma mark Private Method
- (void)__i__initVDNotificationElement {
    
}

- (void)__i__onNofitication:(NSNotification *)notification {
    if (self.notificationBlock) {
        self.notificationBlock(self, notification);
    }
}

@end

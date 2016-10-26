//
//  VDKVOElement.m
//  objcKVO
//
//  Created by Deng on 16/7/25.
//  Copyright © Deng. All rights reserved.
//

#import "VDKVOElement.h"
#import "objcKeyPath.h"
#import "objcBlock.h"
#import "objcHook.h"


@interface VDKVOElement ()

@property (nonatomic, assign, readwrite) BOOL isDisposed;
@property (nonatomic, strong) VDHookElement *hookedDeallocElement;

@end


@implementation VDKVOElement

#pragma mark Public Method
- (instancetype)initWithTarget:(id)target keyPath:(NSString *)keyPath action:(void(^)(VDKVOElement *element, VDKVOChange *change))action {
    self = [super init];
    
    _target = target;
    _keyPath = [keyPath copy];
    _kvoAction = action;
    
    [_target addObserver:self forKeyPath:keyPath options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial) context:NULL];
    VDWeakifySelf;
    self.hookedDeallocElement = [_target vd_hookSelector:VDHookDeallocSelector beforeBlock:^(VDHookElement *element, VDHookInvocationInfo *info) {
        VDStrongifySelf;
        [info.invocation.target removeObserver:self forKeyPath:self.keyPath];
        [self dispose];
    }];
    
    return self;
}

- (void)dispose {
    [self.target removeObserver:self forKeyPath:self.keyPath];
    [self.hookedDeallocElement dispose];
    self.isDisposed = YES;
}

#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
        
    return self;
}

- (void)dealloc {
    [self dispose];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.target
        && [keyPath isEqualToString:self.keyPath]
        && self.kvoAction) {
        self.kvoAction(self, [VDKVOChange changeWithDictionary:change]);
    }
}

#pragma mark Delegates


#pragma mark Private Method

@end

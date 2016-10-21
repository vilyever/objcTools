//
//  VDHookInvocationInfo.m
//  objcHook
//
//  Created by Deng on 16/6/17.
//  Copyright © Deng. All rights reserved.
//

#import "VDHookInvocationInfo.h"


@interface VDHookInvocationInfo ()


@end


@implementation VDHookInvocationInfo

#pragma mark Public Method
+ (instancetype)infoWithInvocation:(NSInvocation *)invocation {
    VDHookInvocationInfo *info = [[VDHookInvocationInfo alloc] init];
    info.invocation = invocation;
    return info;
}

- (void)getOriginalReturnValue:(void *)valuePtr {
    // todo chekc should find in super class to invoke
    
    [self.invocation invoke];
    [self.invocation getReturnValue:valuePtr];
}

- (void)setReturnValue:(void *)valuePtr {
    [self.invocation setReturnValue:valuePtr];
}

- (void)getArgument:(void *)argument atIndex:(NSInteger)idx {
    // 0 is instance, 1 is selector
    [self.invocation getArgument:argument atIndex:idx + 2];
}

- (__unsafe_unretained id)getArgumentAtIndex:(NSInteger)idx {
    __unsafe_unretained id argument;
    [self getArgument:&argument atIndex:idx];
    return argument;
}

- (__unsafe_unretained NSString *)getStringArgumentAtIndex:(NSInteger)idx {
    __unsafe_unretained NSString *argument;
    [self getArgument:&argument atIndex:idx];
    return argument;
}

- (NSInteger)getIntegerArgumentAtIndex:(NSInteger)idx {
    NSInteger argument;
    [self getArgument:&argument atIndex:idx];
    return argument;
}

- (int)getIntArgumentAtIndex:(NSInteger)idx {
    int argument;
    [self getArgument:&argument atIndex:idx];
    return argument;
}

- (BOOL)getBoolArgumentAtIndex:(NSInteger)idx {
    BOOL argument;
    [self getArgument:&argument atIndex:idx];
    return argument;
}

- (float)getFloatArgumentAtIndex:(NSInteger)idx {
    float argument;
    [self getArgument:&argument atIndex:idx];
    return argument;
}

- (double)getDoubleArgumentAtIndex:(NSInteger)idx {
    double argument;
    [self getArgument:&argument atIndex:idx];
    return argument;
}

- (char)getCharArgumentAtIndex:(NSInteger)idx {
    char argument;
    [self getArgument:&argument atIndex:idx];
    return argument;
}

- (long)getLongArgumentAtIndex:(NSInteger)idx {
    long argument;
    [self getArgument:&argument atIndex:idx];
    return argument;
}

- (SEL)getSELArgumentAtIndex:(NSInteger)idx {
    SEL argument;
    [self getArgument:&argument atIndex:idx];
    return argument;
}

- (void)setArgument:(void *)argument atIndex:(NSInteger)idx {
    // 0 is instance, 1 is selector
    [self.invocation setArgument:argument atIndex:idx + 2];
}

- (void)retainArguments {
    [self.invocation retainArguments];
}


#pragma mark Properties

#pragma mark Overrides
- (instancetype)init {
    self = [super init];

    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method

@end

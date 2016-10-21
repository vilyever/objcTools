//
//  NSObject+VDSelectorArgument.m
//  objcSelectorArgument
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSObject+VDSelectorArgument.h"

//#import <objc/runtime.h>


@implementation NSObject (VDSelectorArgument)

#pragma mark Constructor


#pragma mark Public Method
- (void)vd_performSelector:(SEL)selector withArguments:(NSArray *)arguments {
    [self vd_performSelector:selector withArguments:arguments afterDelay:0];
}

- (void)vd_performSelector:(SEL)selector withArguments:(NSArray *)arguments afterDelay:(NSTimeInterval)delay {
    if ([self respondsToSelector:selector]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:selector]];
        [invocation setTarget:self];
        [invocation setSelector:selector];
        
        NSInteger index = 2;
        for (VDSelectorArgument *argument in arguments) {
            switch (argument.type) {
                case VDSelectorArgumentTypeCopiedObject: {
                    NSObject *a = argument.copiedObject;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
                case VDSelectorArgumentTypeWeakObject: {
                    NSObject *a = argument.weakObject;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
                case VDSelectorArgumentTypeStrongObject: {
                    NSObject *a = argument.strongObject;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
                case VDSelectorArgumentTypeAssignObject: {
                    NSObject *a = argument.assignObject;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
                case VDSelectorArgumentTypeInt: {
                    int a = argument.intArgument;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
                case VDSelectorArgumentTypeLong: {
                    long a = argument.longArgument;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
                case VDSelectorArgumentTypeChar: {
                    char a = argument.charArgument;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
                case VDSelectorArgumentTypeBool: {
                    BOOL a = argument.boolArgument;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
                case VDSelectorArgumentTypeFloat: {
                    float a = argument.floatArgument;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
                case VDSelectorArgumentTypeDouble: {
                    double a = argument.doubleArgument;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
                case VDSelectorArgumentTypeNSInteger: {
                    NSInteger a = argument.integerArgument;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
                case VDSelectorArgumentTypeNSUInteger: {
                    NSUInteger a = argument.uintegerArgument;
                    [invocation setArgument:&a atIndex:index];
                    break;
                }
            }
            
            index++;
        }
        
        if (delay <= 0) {
            [invocation invoke];
        }
        else {
            [invocation performSelector:@selector(invoke) withObject:nil afterDelay:delay];
        }
    }
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

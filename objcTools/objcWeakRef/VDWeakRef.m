//
//  VDWeakRef.m
//  objcWeakRef
//
//  Created by Deng on 16/6/28.
//  Copyright © Deng. All rights reserved.
//

#import "VDWeakRef.h"
#import <objc/runtime.h>


@interface VDWeakRef ()

@property (nonatomic, weak, readwrite) id weakObject;
@property (nonatomic, strong) id sampleObject;

@end


@implementation VDWeakRef

#pragma mark Constructor
+ (instancetype)refWithObject:(id)object {
    return [[self alloc] initWithObject:object];
}

- (instancetype)initWithObject:(id)object {
    if (!object) {
        NSLog(@"WeakRef cannot init with nil");
        return nil;
    }
    
    _weakObject = object;
    _sampleObject = [[object class] alloc];
    
    return self;
}

#pragma mark Public Method


#pragma mark Properties


#pragma mark Overrides
- (void)forwardInvocation:(NSInvocation *)invocation {
    if (!_weakObject) {
        return;
    }
    
    if ([NSStringFromSelector(invocation.selector) isEqualToString:NSStringFromSelector(@selector(initWithObject:))]) {
        [invocation invoke];
        return;
    }
    
    if ([NSStringFromSelector(invocation.selector) isEqualToString:NSStringFromSelector(@selector(weakObject))]) {
        [invocation invoke];
        return;
    }
    
    if ([NSStringFromSelector(invocation.selector) isEqualToString:NSStringFromSelector(@selector(setWeakObject:))]) {
        [invocation invoke];
        return;
    }
    
    invocation.target = _weakObject;
    [invocation invoke];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if (!_weakObject) {
        return [_sampleObject methodSignatureForSelector:sel];
    }
    
    return [_weakObject methodSignatureForSelector:sel];
}

- (NSString *)description {
    if (!_weakObject) {
        return [super description];
    }
    
    return [_weakObject description];
}

- (BOOL)isEqual:(id)object {
    return [_weakObject isEqual:object];
}


#pragma mark Delegates


#pragma mark Protected Method


#pragma mark Private Method

@end


@implementation NSObject (VDWeakRef)

#pragma mark Public Method
- (VDWeakRef *)vd_weakRef {
    return [VDWeakRef refWithObject:self];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method
//- (BOOL)vd_isEqual:(id)object {
//    id realSelf = [self class]  == [VDWeakRef class] ? ((VDWeakRef *)self).weakObject : self;
//    id realObject =  [object class]  == [VDWeakRef class] ? ((VDWeakRef *)object).weakObject : object;
//    
//    BOOL result = [realSelf vd_isEqual:realObject];
//    return result;
//}

//+ (void)load {
//    method_exchangeImplementations(class_getInstanceMethod(self, @selector(isEqual:) ), class_getInstanceMethod(self, @selector(vd_isEqual:) ) );
//}

@end

@implementation NSArray (VDWeakRef)

- (NSUInteger)vd_indexOfWeakObject:(id)anObject {
    NSUInteger index = [self indexOfObject:anObject];
    if (index == NSNotFound) {
        for (NSUInteger i = 0; i < self.count; i++) {
            if ([[self objectAtIndex:i] isEqual:anObject]) {
                index = i;
                break;
            }
        }
    }
    
    return index;
}

- (BOOL)vd_containsWeakObject:(id)anObject {
    BOOL result = [self containsObject:anObject];
    if (!result) {
        for (NSUInteger i = 0; i < self.count; i++) {
            if ([[self objectAtIndex:i] isEqual:anObject]) {
                result = YES;
                break;
            }
        }
    }
    
    return result;
}


@end

@implementation NSMutableArray (VDWeakRef)

- (void)vd_addWeakObject:(id)anObject {
    [self addObject:[anObject vd_weakRef]];
}

- (void)vd_insertWeakObject:(id)anObject atIndex:(NSUInteger)index {
    [self insertObject:[anObject vd_weakRef] atIndex:index];
}

- (void)vd_removeWeakObject:(id)anObject {
    if ([self containsObject:anObject]) {
        [self removeObject:anObject];
    }
    else if ([self vd_containsWeakObject:anObject]) {
        [self removeObjectAtIndex:[self vd_indexOfWeakObject:anObject]];
    }
}

@end

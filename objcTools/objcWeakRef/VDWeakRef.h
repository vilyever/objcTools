//
//  VDWeakRef.h
//  objcWeakRef
//
//  Created by Deng on 16/6/28.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@class VDWeakRef;


@interface VDWeakRef : NSProxy

#pragma mark Constructor
+ (instancetype)refWithObject:(id)object;
- (instancetype)initWithObject:(id)object;

#pragma mark Public Method


#pragma mark Properties
@property (nonatomic, weak, readonly) id weakObject;


#pragma mark Protected Method


#pragma mark Private Method


@end

@interface NSObject (VDWeakRef)

#pragma mark Public Method
- (VDWeakRef *)vd_weakRef;

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method

@end

@interface NSArray (VDWeakRef)

- (NSUInteger)vd_indexOfWeakObject:(id)anObject;
- (BOOL)vd_containsWeakObject:(id)anObject;


@end

@interface NSMutableArray (VDWeakRef)

- (void)vd_addWeakObject:(id)anObject;
- (void)vd_insertWeakObject:(id)anObject atIndex:(NSUInteger)index;
- (void)vd_removeWeakObject:(id)anObject;

@end

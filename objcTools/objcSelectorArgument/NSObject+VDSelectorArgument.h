//
//  NSObject+VDSelectorArgument.h
//  objcSelectorArgument
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDSelectorArgument.h"


@interface NSObject (VDSelectorArgument)

#pragma mark Constructor


#pragma mark Public Method
- (void)vd_performSelector:(SEL)selector withArguments:(NSArray *)arguments;
- (void)vd_performSelector:(SEL)selector withArguments:(NSArray *)arguments afterDelay:(NSTimeInterval)delay;

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

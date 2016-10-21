//
//  UITableView+VDTouches.m
//  objcTableView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UITableView+VDTouches.h"

//#import <objc/runtime.h>


@implementation UITableView (VDTouches)

#pragma mark Constructor


#pragma mark Public Method
- (void)vd_setDelaysContentTouches:(BOOL)delay {
    self.delaysContentTouches = delay;
    for (id view in [self.subviews copy]) {
        if ([view respondsToSelector:@selector(setDelaysContentTouches:)]) {
            [view setDelaysContentTouches:delay];
        }
    }
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

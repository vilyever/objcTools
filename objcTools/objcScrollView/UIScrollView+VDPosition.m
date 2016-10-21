//
//  UIScrollView+VDPosition.m
//  objcScrollView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIScrollView+VDPosition.h"

//#import <objc/runtime.h>


@implementation UIScrollView (VDPosition)

#pragma mark Constructor


#pragma mark Public Method
- (BOOL)vd_isReachTop {
    return self.contentOffset.y <= 0;
}

- (BOOL)vd_isReachBottom {
    return self.contentOffset.y >= (self.contentSize.height - self.bounds.size.height);
}

- (void)vd_scrollToBottom:(BOOL)animated {
    if (self.contentSize.height <= self.bounds.size.height) {
        return;
    }
    
    [self setContentOffset:CGPointMake(self.contentOffset.x, (self.contentSize.height - self.bounds.size.height)) animated:animated];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

//
//  UIViewController+VDViewState.m
//  objcViewController
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIViewController+VDViewState.h"

//#import <objc/runtime.h>


@implementation UIViewController (VDViewState)

#pragma mark Constructor


#pragma mark Public Method
- (BOOL)vd_isViewAppeared {
    return self.isViewLoaded && self.view.window;
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

//
//  UIViewController+VDHierarchy.h
//  objcViewController
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (VDHierarchy)

#pragma mark Constructor


#pragma mark Public Method
+ (UIViewController*)vd_topViewController;

// 当前controller的最上层的parentViewController, 通常为被present的controller或nav中的controller或tab中的controller
- (UIViewController *)vd_superiorViewController;

- (void)vd_addChildViewController:(UIViewController *)controller toView:(UIView *)view;

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

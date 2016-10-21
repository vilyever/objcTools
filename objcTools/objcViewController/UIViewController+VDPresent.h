//
//  UIViewController+VDPresent.h
//  objcViewController
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (VDPresent)

#pragma mark Constructor


#pragma mark Public Method
// with direction, it must length larger than 52.0f to show arrow
- (UIPopoverPresentationController *)vd_popoverFromView:(UIView *)view atDirection:(UIPopoverArrowDirection)direction shouldDisplayArrow:(BOOL)shouldDisplayArrow fromViewController:(UIViewController *)controller;

- (UIPopoverPresentationController *)vd_popoverInCenterOfWindowFromViewController:(UIViewController *)controller;

- (void)vd_dismiss;
- (void)vd_dismissWithAnimation:(BOOL)animated;

+ (void)vd_backToRootViewController;

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

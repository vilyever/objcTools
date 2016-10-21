//
//  UIViewController+VDPresent.m
//  objcViewController
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIViewController+VDPresent.h"

#import "objcWindow.h"


@implementation UIViewController (VDPresent)

#pragma mark Constructor


#pragma mark Public Method
- (UIPopoverPresentationController *)vd_popoverFromView:(UIView *)view atDirection:(UIPopoverArrowDirection)direction shouldDisplayArrow:(BOOL)shouldDisplayArrow fromViewController:(UIViewController *)controller {
    self.modalPresentationStyle = UIModalPresentationPopover;
    
    [controller presentViewController:self animated:YES completion:nil];
    UIPopoverPresentationController *popoverPresentationController = self.popoverPresentationController;
    popoverPresentationController.sourceView = view;
    
    if (shouldDisplayArrow) {
        popoverPresentationController.sourceRect = view.bounds;
        popoverPresentationController.permittedArrowDirections = direction;
    }
    else {
        CGFloat PopoverVerticalOffset = 7.0f;
        
        switch (direction) {
            case UIPopoverArrowDirectionUp:
            case UIPopoverArrowDirectionAny:
            case UIPopoverArrowDirectionUnknown:
                popoverPresentationController.sourceRect = CGRectMake(0.0f, (self.preferredContentSize.height + view.bounds.size.height) / 2.0f + PopoverVerticalOffset, view.bounds.size.width, view.bounds.size.height);
                break;
            case UIPopoverArrowDirectionDown:
                popoverPresentationController.sourceRect = CGRectMake(0.0f, -(self.preferredContentSize.height + view.bounds.size.height) / 2.0f + PopoverVerticalOffset, view.bounds.size.width, view.bounds.size.height);
                break;
            case UIPopoverArrowDirectionLeft:
                popoverPresentationController.sourceRect = CGRectMake( (self.preferredContentSize.width + view.bounds.size.width) / 2.0f, PopoverVerticalOffset, view.bounds.size.width, view.bounds.size.height);
                break;
            case UIPopoverArrowDirectionRight:
                popoverPresentationController.sourceRect = CGRectMake(-(self.preferredContentSize.width + view.bounds.size.width) / 2.0f, PopoverVerticalOffset, view.bounds.size.width, view.bounds.size.height);
                break;
                
            default:
                break;
        }
        popoverPresentationController.permittedArrowDirections = 0;
    }
    
    return popoverPresentationController;
}

- (UIPopoverPresentationController *)vd_popoverInCenterOfWindowFromViewController:(UIViewController *)controller {
    self.modalPresentationStyle = UIModalPresentationPopover;
    [controller presentViewController:self animated:YES completion:NULL];
    UIPopoverPresentationController *popoverPresentationController = self.popoverPresentationController;
    popoverPresentationController.sourceView = VDWindow;
    popoverPresentationController.sourceRect = VDWindow.bounds;
    popoverPresentationController.permittedArrowDirections = 0;
    
    return popoverPresentationController;
}

- (void)vd_dismiss {
    [self vd_dismissWithAnimation:YES];
}

- (void)vd_dismissWithAnimation:(BOOL)animated {
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:animated completion:nil];
    }
    else if (self.navigationController && self.navigationController.topViewController == self) {
        [self.navigationController popViewControllerAnimated:animated];
    }
}

+ (void)vd_backToRootViewController {
    UIViewController *rootViewController = VDWindow.rootViewController;
    UIViewController *presentedViewController = rootViewController;
    while (presentedViewController.presentedViewController) {
        presentedViewController = presentedViewController.presentedViewController;
    }
    
    UIViewController *presentingViewController;
    while (presentedViewController != rootViewController) {
        presentingViewController = presentedViewController.presentingViewController;
        [presentedViewController dismissViewControllerAnimated:NO completion:nil];
        presentedViewController = presentingViewController;
    }
    
    if ( [rootViewController isKindOfClass:[UINavigationController class] ] ) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        [navigationController popToRootViewControllerAnimated:NO];
    }
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

//
//  UIViewController+VDHierarchy.m
//  objcViewController
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIViewController+VDHierarchy.h"

#import "objcWindow.h"
#import "objcView.h"


@implementation UIViewController (VDHierarchy)

#pragma mark Constructor


#pragma mark Public Method
+ (UIViewController *)vd_topViewController {
    return [self vd_topViewControllerWithRootViewController:nil];
}

- (UIViewController *)vd_superiorViewController {
    UIViewController *superiorViewController = self;
    while (superiorViewController.parentViewController) {
        if (!superiorViewController.parentViewController.parentViewController
            && ([superiorViewController.parentViewController isKindOfClass:[UINavigationController class]]
                || [superiorViewController.parentViewController isKindOfClass:[UITabBarController class]])) {
                break;
            }
        
        superiorViewController = superiorViewController.parentViewController;
    }
    
    return superiorViewController;
}

- (void)vd_addChildViewController:(UIViewController *)controller toView:(UIView *)view {
    [self addChildViewController:controller];
    [view vd_addSubviewSpreadAutoLayout:controller.view];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method
+ (UIViewController*)vd_topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if (!rootViewController) {
        rootViewController = VDWindow.rootViewController;
    }
    
    if ( [rootViewController isKindOfClass:[UITabBarController class] ] ) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self vd_topViewControllerWithRootViewController:tabBarController.selectedViewController];
    }
    else if ( [rootViewController isKindOfClass:[UINavigationController class] ] ) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self vd_topViewControllerWithRootViewController:navigationController.visibleViewController];
    }
    else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self vd_topViewControllerWithRootViewController:presentedViewController];
    }
    else {
        return rootViewController;
    }
}

@end

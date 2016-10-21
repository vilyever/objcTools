//
//  VDRouterNavigationController.m
//  objcRouter
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "VDRouterNavigationController.h"


@interface VDRouterNavigationController ()


@end


@implementation VDRouterNavigationController

#pragma mark Constructor
- (instancetype)init {
    self = [super initWithRootViewController:[UIViewController new]];
    return self;
}

#pragma mark Public Method
- (void)setRootViewController:(UIViewController *)controller {
    [self setViewControllers:[NSArray arrayWithObjects:controller, nil]];
}

#pragma mark Properties


#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
}

- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.topViewController preferredStatusBarStyle];;
}

#pragma mark IBActions


#pragma mark Delegates


#pragma mark Protected Method


#pragma mark Private Methods


@end

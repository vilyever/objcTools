//
//  VDRouter.h
//  objcRouter
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VDRouterNavigationController.h"

@class VDRouter;


@interface VDRouter : NSObject

#pragma mark Constructor
+ (VDRouter *)sharedRouter;

#pragma mark Public Method
- (void)bindViewController:(Class)vcClass withIdentifier:(NSString *)identifier;
- (Class)viewControllerClassForIdentifier:(NSString *)identifier;

- (void)setRootViewControllerWithIdentifier:(NSString *)identifier;

- (UIViewController *)push:(NSString *)identifier;
- (UIViewController *)push:(NSString *)identifier withPrepareAction:(void(^)(UIViewController *controller))prepareAction;
- (UIViewController *)present:(NSString *)identifier;
- (UIViewController *)present:(NSString *)identifier withPrepareAction:(void(^)(UIViewController *controller))prepareAction;

#pragma mark Properties
@property (nonatomic, strong, readonly) VDRouterNavigationController *rootNavigationController;
@property (nonatomic, strong, readonly) NSMutableDictionary *bindedViewControllers;

#pragma mark Protected Method


#pragma mark Private Method


@end

//
//  VDRouter.m
//  objcRouter
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "VDRouter.h"
#import "objcWindow.h"
#import "objcViewController.h"

@interface VDRouter ()

- (void)__i__initVDRouter;

@property (nonatomic, strong, readwrite) VDRouterNavigationController *rootNavigationController;
@property (nonatomic, strong, readwrite) NSMutableDictionary *bindedViewControllers;

@end


@implementation VDRouter

#pragma mark Constructor
+ (VDRouter *)sharedRouter {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[VDRouter alloc] init];
    } );
    
    return _sharedInstance;
}


#pragma mark Public Method
- (void)bindViewController:(Class)vcClass withIdentifier:(NSString *)identifier {
    [self.bindedViewControllers setObject:vcClass forKey:identifier];
}

- (Class)viewControllerClassForIdentifier:(NSString *)identifier {
    return [self.bindedViewControllers objectForKey:identifier];
}

- (void)setRootViewControllerWithIdentifier:(NSString *)identifier {
    VDWindow.rootViewController = self.rootNavigationController;
    
    Class viewControllerClass = [self.bindedViewControllers objectForKey:identifier];
    NSAssert(viewControllerClass, @"rootViewControllerIdentifier must be binded with a ViewController's class");
    
    UIViewController *rootViewController = [[viewControllerClass alloc] init];
    [self.rootNavigationController setRootViewController:rootViewController];
}

- (UIViewController *)push:(NSString *)identifier {
    return [self push:identifier withPrepareAction:nil];
}

- (UIViewController *)push:(NSString *)identifier withPrepareAction:(void (^)(UIViewController *))prepareAction {
    Class viewControllerClass = [self.bindedViewControllers objectForKey:identifier];
    if (viewControllerClass) {
        UIViewController *targetViewController = [[viewControllerClass alloc] init];
        if (prepareAction) {
            prepareAction(targetViewController);
        }
        [self.rootNavigationController pushViewController:targetViewController animated:YES];
        
        return targetViewController;
    }
    
    return nil;
}

- (UIViewController *)present:(NSString *)identifier {
    return [self present:identifier withPrepareAction:nil];
}

- (UIViewController *)present:(NSString *)identifier withPrepareAction:(void (^)(UIViewController *))prepareAction {
    Class viewControllerClass = [self.bindedViewControllers objectForKey:identifier];
    if (viewControllerClass) {
        UIViewController *targetViewController = [[viewControllerClass alloc] init];
        if (prepareAction) {
            prepareAction(targetViewController);
        }
        [[UIViewController vd_topViewController] presentViewController:targetViewController animated:YES completion:NULL];
        
        return targetViewController;
    }
    
    return nil;
}

#pragma mark Properties
- (VDRouterNavigationController *)rootNavigationController {
    if (!_rootNavigationController) {
        _rootNavigationController = [[VDRouterNavigationController alloc] init];
    }
    
    return _rootNavigationController;
}

- (NSMutableDictionary *)bindedViewControllers {
    if (!_bindedViewControllers) {
        _bindedViewControllers = [NSMutableDictionary new];
    }
    
    return _bindedViewControllers;
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    // Initialization code
    [self __i__initVDRouter];

    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Protected Method


#pragma mark Private Method
- (void)__i__initVDRouter {
    
}

@end

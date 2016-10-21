//
//  UIViewController+VDInstance.m
//  objcViewController
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIViewController+VDInstance.h"

//#import <objc/runtime.h>


@implementation UIViewController (VDInstance)

#pragma mark Constructor
+ (instancetype)vd_controllerFromNib {
    return [ [self class] vd_controllerFromNibWithNibName:NSStringFromClass( [self class] ) ];
}

+ (instancetype)vd_controllerFromNibWithNibName:(NSString *)nibName {
    return [ [ [self class] alloc] initWithNibName:nibName bundle:nil];
}

+ (instancetype)vd_controllerFromStoryboard {
    return [ [self class] vd_controllerFromStoryboardWithStoryboardName:@"Main" withIdentifier:NSStringFromClass( [self class] ) ];
}

+ (instancetype)vd_controllerFromStoryboardWithStoryboardName:(NSString *)storyboardName {
    return [ [self class] vd_controllerFromStoryboardWithStoryboardName:storyboardName withIdentifier:NSStringFromClass( [self class] ) ];
}

+ (instancetype)vd_controllerFromStoryboardWithStoryboardName:(NSString *)storyboardName withIdentifier:(NSString *)identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

#pragma mark Public Method


#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

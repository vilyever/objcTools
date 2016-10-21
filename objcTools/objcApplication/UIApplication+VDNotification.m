//
//  UIApplication+VDNotification.m
//  objcApplication
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIApplication+VDNotification.h"

//#import <objc/runtime.h>


@implementation UIApplication (VDNotification)

#pragma mark Constructor


#pragma mark Public Method
+ (void)vd_clearNotifications {
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

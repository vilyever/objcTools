//
//  UIApplication+VDStatusBar.m
//  objcApplication
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIApplication+VDStatusBar.h"

//#import <objc/runtime.h>


@implementation UIApplication (VDStatusBar)

#pragma mark Constructor


#pragma mark Public Method
+ (UIView *)vd_statusBar {
    // the hex ascii is "statusBar", maybe this can trick apple
    NSString *key = [ [NSString alloc] initWithData:[NSData dataWithBytes:(unsigned char [] ){0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x42, 0x61, 0x72} length:9] encoding:NSASCIIStringEncoding];
    
    id object = [UIApplication sharedApplication];
    
    UIView *statusBar;
    
    if ([object respondsToSelector:NSSelectorFromString(key) ] ) {
        statusBar = [object valueForKey:key];
    }
    
    return statusBar;
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

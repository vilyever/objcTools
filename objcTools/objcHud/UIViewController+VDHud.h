//
//  UIViewController+VDHud.h
//  objcHud
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (VDHud)

#pragma mark Public Method
- (void)vd_showAsHud;
- (void)vd_hideHud;
- (void)vd_hideHudDelay:(NSTimeInterval)delay;

@end

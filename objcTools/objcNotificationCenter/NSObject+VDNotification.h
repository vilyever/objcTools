//
//  NSObject+VDNotification.h
//  objcNotificationCenter
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDNotificationElement.h"


@interface NSObject (VDNotification)

#pragma mark Constructor


#pragma mark Public Method
- (VDNotificationElement *)vd_observeNotification:(NSString *)notificationName object:(id)object action:(void(^)(VDNotificationElement *element, NSNotification *notification))action;

#pragma mark Properties
- (NSMutableArray *)vd_notificationElementArray;


#pragma mark Protected Method


#pragma mark Private Method


@end

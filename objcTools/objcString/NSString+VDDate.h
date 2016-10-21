//
//  NSString+VDDate.h
//  objcString
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (VDDate)

#pragma mark Constructor
+ (NSString *)vd_stringFromDate:(NSDate *)date;
+ (NSString *)vd_stringFromSeconds:(NSInteger)seconds prefix:(NSString *)prefix;

#pragma mark Public Method
- (NSDate *)vd_dateValue;

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

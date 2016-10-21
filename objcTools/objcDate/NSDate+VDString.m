//
//  NSDate+VDString.m
//  objcDate
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSDate+VDString.h"

//#import <objc/runtime.h>
//@import objcTemp;


@implementation NSDate (VDString)

#pragma mark Constructor
+ (NSDate *)vd_dateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [ [NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
}

#pragma mark Public Method
- (NSString *)vd_stringValue {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss GMT+0800"];
    
    NSString *destDateString = [dateFormatter stringFromDate:self];
    
    return destDateString;
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

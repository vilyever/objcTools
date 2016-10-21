//
//  NSString+VDDate.m
//  objcString
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "NSString+VDDate.h"

//#import <objc/runtime.h>


@implementation NSString (VDDate)

#pragma mark Constructor
+ (NSString *)vd_stringFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss GMT+0800"];
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}

+ (NSString *)vd_stringFromSeconds:(NSInteger)seconds prefix:(NSString *)prefix {
    NSInteger hours = 0;
    NSInteger minutes = 0;
    
    hours = seconds / 3600;
    minutes = (seconds - hours * 3600) / 60;
    seconds = seconds - hours * 3600 - minutes * 60;
    
    NSString *formatter = hours < 10 ? @"0%d" : @"%d";
    NSString *strHour = [NSString stringWithFormat:formatter, hours];
    
    formatter = minutes < 10 ? @"0%d" : @"%d";
    NSString *strMinute = [NSString stringWithFormat:formatter, minutes];
    
    formatter = seconds < 10 ? @"0%d" : @"%d";
    NSString *strSecond = [NSString stringWithFormat:formatter, seconds];
    
    return [NSString stringWithFormat:@"%@%@:%@:%@", prefix, strHour, strMinute, strSecond];
}

#pragma mark Public Method
- (NSDate *)vd_dateValue {
    NSDateFormatter *dateFormatter = [ [NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *destDate= [dateFormatter dateFromString:self];
    
    return destDate;
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

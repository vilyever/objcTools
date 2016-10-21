//
//  NSData+VDConcatenate.m
//  objcData
//
//  Created by Deng on 16/8/9.
//  Copyright © Deng. All rights reserved.
//

#import "NSData+VDConcatenate.h"

//#import <objc/runtime.h>


@implementation NSData (VDConcatenate)

#pragma mark Constructor
+ (NSData *)vd_dataWithData:(NSData *)data concatenateData:(NSData *)concatenateData {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_data_t dispatch_data_data = dispatch_data_create([data bytes], [data length], queue, DISPATCH_DATA_DESTRUCTOR_DEFAULT);
    dispatch_data_t dispatch_data_concatenateData = dispatch_data_create([concatenateData bytes], [concatenateData length], queue, DISPATCH_DATA_DESTRUCTOR_DEFAULT);
    
    dispatch_data_t dispatch_data_result = dispatch_data_create_concat(dispatch_data_data, dispatch_data_concatenateData);
    
    NSMutableData *result = [NSMutableData dataWithCapacity:dispatch_data_get_size(dispatch_data_result)];
    dispatch_data_apply(dispatch_data_result, ^bool(dispatch_data_t region, size_t offset, const void *buffer, size_t size) {
        [result appendBytes:buffer length:size];
        return YES;
    });
    
    return result;
}

#pragma mark Public Method


#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

//
//  UITableViewCell+VDDequeue.m
//  objcTableView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UITableViewCell+VDDequeue.h"

//#import <objc/runtime.h>


@implementation UITableViewCell (VDDequeue)

#pragma mark Constructor


#pragma mark Public Method
+ (instancetype)vd_dequeueCellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass( [self class] ) forIndexPath:indexPath];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

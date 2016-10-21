//
//  UITableViewCell+VDRegister.m
//  objcTableView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UITableViewCell+VDRegister.h"

//#import <objc/runtime.h>


@implementation UITableViewCell (VDRegister)

#pragma mark Constructor


#pragma mark Public Method
+ (void)vd_registerNibWithTableView:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass( [self class] ) bundle:nil] forCellReuseIdentifier:NSStringFromClass( [self class] ) ];
}

+ (void)vd_registerClassWithTableView:(UITableView *)tableView {
    [tableView registerClass:self forCellReuseIdentifier:NSStringFromClass( [self class] ) ];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

//
//  UICollectionViewCell+VDRegister.m
//  objcCollectionView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UICollectionViewCell+VDRegister.h"

//#import <objc/runtime.h>
//@import objcTemp;


@implementation UICollectionViewCell (VDRegister)

#pragma mark Constructor


#pragma mark Public Method
+ (void)vd_registerNibWithCollectionView:(UICollectionView *)collectionView {
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass( [self class] ) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass( [self class] ) ];
}

+ (void)vd_registerClassWithCollectionView:(UICollectionView *)collectionView {
    [collectionView registerClass:self forCellWithReuseIdentifier:NSStringFromClass( [self class] ) ];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

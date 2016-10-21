//
//  UICollectionViewCell+VDDequeue.m
//  objcCollectionView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UICollectionViewCell+VDDequeue.h"

//#import <objc/runtime.h>
//@import objcTemp;


@implementation UICollectionViewCell (VDDequeue)

#pragma mark Constructor


#pragma mark Public Method
+ (instancetype)vd_dequeueCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass( [self class] ) forIndexPath:indexPath];
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

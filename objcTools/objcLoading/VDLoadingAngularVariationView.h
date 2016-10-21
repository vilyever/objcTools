//
//  VDLoadingAngularVariationView.h
//  objcLoading
//
//  Created by Deng on 16/7/12.
//  Copyright © Deng. All rights reserved.
//

#import "VDLoadingView.h"


@class VDLoadingAngularVariationView;

@interface VDLoadingAngularVariationView : VDLoadingView

#pragma mark Public Method


#pragma mark Properties
@property (nonatomic, assign) NSInteger minAngular;
@property (nonatomic, assign) NSInteger maxAngular;
@property (nonatomic, assign) NSInteger leapAngular;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat torusWidth;
@property (nonatomic, strong) UIColor *angularColor;

#pragma mark Private Method

@end

//
//  VDThemeSelectorArgument.h
//  objcTheme
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "objcSelectorArgument.h"

extern NSString * const VDThemeSelectorArgumentRemoveThemeKey;

@class VDThemeSelectorArgument;


@interface VDThemeSelectorArgument : VDSelectorArgument

#pragma mark Constructor
+ (instancetype)argumentWithThemeKey:(NSString *)themeKey;
- (instancetype)initWithThemeKey:(NSString *)themeKey;


#pragma mark Public Method


#pragma mark Properties
@property (nonatomic, copy) NSString *themeKey;

@end

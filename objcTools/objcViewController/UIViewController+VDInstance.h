//
//  UIViewController+VDInstance.h
//  objcViewController
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (VDInstance)

#pragma mark Constructor
/**
 *  通过nib初始化VC
 *  @note 使用此方法 xib文件名和VC文件名必须相同
 *
 *  @return 初始化VC
 */
+ (instancetype)vd_controllerFromNib;

/**
 *  通过nib初始化VC
 *
 *  @param nibName xib文件名
 *
 *  @return 初始化VC
 */
+ (instancetype)vd_controllerFromNibWithNibName:(NSString *)nibName;

/**
 *  通过storyboard初始化VC
 *  @note 使用此方法 storyboard文件名必须为默认的Main.storyboard
 *  @note 使用此方法 VC对应的storyboard ID 必须与VC文件名相同
 *
 *  @return 初始化VC
 */
+ (instancetype)vd_controllerFromStoryboard;

/**
 *  通过storyboard初始化VC
 *  @note 使用此方法 VC对应的storyboard ID 必须与VC文件名相同
 *
 *  @param storyboardName storyboard文件名
 *
 *  @return 初始化VC
 */
+ (instancetype)vd_controllerFromStoryboardWithStoryboardName:(NSString *)storyboardName;

/**
 *  通过storyboard初始化VC
 *
 *  @param storyboardName storyboard文件名
 *  @param identifier     storyboard ID
 *
 *  @return 初始化VC
 */
+ (instancetype)vd_controllerFromStoryboardWithStoryboardName:(NSString *)storyboardName withIdentifier:(NSString *)identifier;


#pragma mark Public Method


#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

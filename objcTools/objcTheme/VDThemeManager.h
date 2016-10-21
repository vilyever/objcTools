//
//  VDThemeManager.h
//  objcTheme
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VDThemeElement.h"
#import "VDThemeSelectorArgument.h"

extern NSString * const VDThemeManagerThemeTypeDidChangeNotification;
extern NSString * const VDThemeManagerThemeTypeDidChangeNotificationUserInfoNewThemeTypeKey;
extern NSString * const VDThemeManagerThemeTypeDidChangeNotificationUserInfoOldThemeTypeKey;

@class VDThemeManager;

@protocol VDThemeManagerDatasource <NSObject>

@optional
- (UIColor *)colorForThemeType:(NSInteger)themeType withKey:(NSString *)key;
- (UIImage *)imageForThemeType:(NSInteger)themeType withKey:(NSString *)key;
- (UIFont *)fontForThemeType:(NSInteger)themeType withKey:(NSString *)key;
- (id)attributeForThemeType:(NSInteger)themeType withKey:(NSString *)key;

@end

@interface VDThemeManager : NSObject

#pragma mark Public Method
+ (VDThemeManager *)sharedManager;
+ (void)bindDatasource:(id<VDThemeManagerDatasource>)datasource;
+ (void)setupThemeChangeAnimationDuration:(NSTimeInterval)duration;
+ (void)changeThemeType:(NSInteger)themeType;
+ (void)setDefaultThemeType:(NSInteger)defaultThemeType;

+ (NSInteger)currentThemeType;

+ (UIColor *)colorForKey:(NSString *)key;
+ (UIImage *)imageForKey:(NSString *)key;
+ (UIFont *)fontForKey:(NSString *)key;
+ (id)attributeForKey:(NSString *)key;

+ (void)setColorForTarget:(id)target selector:(SEL)selector arguments:(NSArray *)arguments;
+ (void)setImageForTarget:(id)target selector:(SEL)selector arguments:(NSArray *)arguments;
+ (void)setFontForTarget:(id)target selector:(SEL)selector arguments:(NSArray *)arguments;
+ (void)setAttributeForTarget:(id)target selector:(SEL)selector arguments:(NSArray *)arguments;
+ (void)removeTarget:(id)target;
+ (void)removeTarget:(id)target selector:(SEL)selector arguments:(NSArray *)arguments;

#pragma mark Properties
@property (nonatomic, weak) id<VDThemeManagerDatasource> datasource;

@property (nonatomic, assign) NSInteger themeType;
@property (nonatomic, assign) NSTimeInterval animationDuration;

#pragma mark Private Method

@end

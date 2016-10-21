//
//  NSObject+VDThemeManager.h
//  objcTheme
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDThemeManager.h"

@interface NSObject (VDThemeManager)

#pragma mark Public Method
- (void)vd_addThemeElement:(VDThemeElement *)element;
- (void)vd_removeThemeElement:(VDThemeElement *)element;
- (void)vd_clearThemeElements;

- (void)vd_performElement:(VDThemeElement *)element;
- (void)vd_onThemeChange:(NSInteger)newThemeType withOldThemeType:(NSInteger)oldThemeType;

#pragma mark Properties

#pragma mark Private Method
- (NSMutableArray *)vd_themeElements;

@end

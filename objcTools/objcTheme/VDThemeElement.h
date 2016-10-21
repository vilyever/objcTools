//
//  VDThemeElement.h
//  objcTheme
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDThemeSelectorArgument.h"

typedef NS_ENUM(NSInteger, VDThemeElementResourceType) {
    VDThemeElementResourceTypeRemove, // mark for removing element, just for equal judgment
    VDThemeElementResourceTypeColor,
    VDThemeElementResourceTypeImage,
    VDThemeElementResourceTypeFont,
    VDThemeElementResourceTypeAttribute,
};

@class VDThemeElement;


@interface VDThemeElement : NSObject

#pragma mark Constructor
+ (instancetype)elementWithResourceType:(VDThemeElementResourceType)resourceType selector:(SEL)selector arguments:(NSArray *)arguments;
- (instancetype)initWithResourceType:(VDThemeElementResourceType)resourceType selector:(SEL)selector arguments:(NSArray *)arguments;

#pragma mark Public Method


#pragma mark Properties
@property (nonatomic, assign) VDThemeElementResourceType resourceType;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) NSArray *arguments;
@property (nonatomic, strong) VDThemeSelectorArgument *themeSelectorArgument;

@end

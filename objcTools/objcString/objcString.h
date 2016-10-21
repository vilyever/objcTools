//
//  objcString.h
//  objcString
//
//  Created by FTET on 16/8/5.
//  Copyright © 2016年 vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for objcString.
FOUNDATION_EXPORT double objcStringVersionNumber;

//! Project version string for objcString.
FOUNDATION_EXPORT const unsigned char objcStringVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import "PublicHeader.h"

#import "NSString+VDDate.h"
#import "NSString+VDValue.h"
#import "NSString+VDEmpty.h"
#import "NSString+Change.h"
#import "NSString+VDRegex.h"
#import "NSString+VDUrl.h"


#pragma mark VDKeyPath
#if !VDKeyPath
#define VDKeyPath(target, path) \
@(((void)(NO && ((void)target.path, NO)), # path))
#endif

#if !VDBoolToString
#define VDBoolToString(bool) \
((bool) ? @"YES" : @"NO")
#endif

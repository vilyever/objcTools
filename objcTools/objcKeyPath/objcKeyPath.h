//
//  objcKeyPath.h
//  objcKeyPath
//
//  Created by FTET on 16/8/5.
//  Copyright © 2016年 vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for objcKeyPath.
FOUNDATION_EXPORT double objcKeyPathVersionNumber;

//! Project version string for objcKeyPath.
FOUNDATION_EXPORT const unsigned char objcKeyPathVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import "PublicHeader.h"

#pragma mark VDKeyPath
#if !VDKeyPath
#define VDKeyPath(target, path) \
@(((void)(NO && ((void)target.path, NO)), # path))
#endif


//
//  objcApplication.h
//  objcApplication
//
//  Created by FTET on 16/8/5.
//  Copyright © 2016年 vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for objcApplication.
FOUNDATION_EXPORT double objcApplicationVersionNumber;

//! Project version string for objcApplication.
FOUNDATION_EXPORT const unsigned char objcApplicationVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import "PublicHeader.h"

#import "UIApplication+VDNotification.h"
#import "UIApplication+VDStatusBar.h"

#if !VDSharedApplication
#define VDSharedApplication \
[UIApplication sharedApplication]
#endif

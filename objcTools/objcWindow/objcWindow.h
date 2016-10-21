//
//  objcWindow.h
//  objcWindow
//
//  Created by FTET on 16/8/5.
//  Copyright © 2016年 vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for objcWindow.
FOUNDATION_EXPORT double objcWindowVersionNumber;

//! Project version string for objcWindow.
FOUNDATION_EXPORT const unsigned char objcWindowVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import "PublicHeader.h"

#if !VDWindow
#define VDWindow \
[[[UIApplication sharedApplication] delegate] window]
#endif

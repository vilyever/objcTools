//
//  objcUserDefaults.h
//  objcUserDefaults
//
//  Created by FTET on 16/8/5.
//  Copyright © 2016年 vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for objcUserDefaults.
FOUNDATION_EXPORT double objcUserDefaultsVersionNumber;

//! Project version string for objcUserDefaults.
FOUNDATION_EXPORT const unsigned char objcUserDefaultsVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import "PublicHeader.h"

#if !VDStandardUserDefaults
#define VDStandardUserDefaults \
[NSUserDefaults standardUserDefaults]
#endif

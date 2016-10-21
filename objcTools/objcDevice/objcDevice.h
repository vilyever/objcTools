//
//  objcDevice.h
//  objcDevice
//
//  Created by FTET on 16/8/5.
//  Copyright © 2016年 vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for objcDevice.
FOUNDATION_EXPORT double objcDeviceVersionNumber;

//! Project version string for objcDevice.
FOUNDATION_EXPORT const unsigned char objcDeviceVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import "PublicHeader.h"

#if !VDDeviceVersionCheck
#define VDDeviceVersionCheck(version) \
([[[UIDevice currentDevice] systemVersion] floatValue] >= version ? YES : NO)
#endif

#if !VDDeviceiOS8Check
#define VDDeviceiOS8Check \
([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)
#endif

#if !VDDevicePadCheck
#define VDDevicePadCheck \
(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#endif

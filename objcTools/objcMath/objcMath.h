//
//  objcMath.h
//  objcMath
//
//  Created by FTET on 16/8/5.
//  Copyright © 2016年 vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for objcMath.
FOUNDATION_EXPORT double objcMathVersionNumber;

//! Project version string for objcMath.
FOUNDATION_EXPORT const unsigned char objcMathVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import "PublicHeader.h"

#if !VDCGFloatSign
#define VDFloatSign(float) \
(float < 0.0f ? -1.0f : 1.0f)
#endif

#ifndef VDMatrixVerticalArrangeToHorizonArrange
#define VDMatrixVerticalArrangeToHorizonArrange(num, rowCount, columnCount) \
(num * columnCount - (num / rowCount) * (rowCount * columnCount - 1) )
#endif

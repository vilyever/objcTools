//
//  objcBlock.h
//  objcBlock
//
//  Created by FTET on 16/8/5.
//  Copyright © 2016年 vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for objcBlock.
FOUNDATION_EXPORT double objcBlockVersionNumber;

//! Project version string for objcBlock.
FOUNDATION_EXPORT const unsigned char objcBlockVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import "PublicHeader.h"

/**
 *  Declare Block
 *  
 *  Local Var:
 *      returnType (^blockName)(paramsType) = ^returnType(params){};
 *      void(^action)(void) = ^void(){};
 *
 *
 *  Property:
 *      @property (nonatomic, copy) returnType (^blockName)(paramsType);
 *      @property (nonatomic, copy) void (^action)(void);
 *
 *
 *  Declare Method Param:
 *      - (void)doAction:(returnType (^)(paramsType))blockName;
 *      - (void)doAction:(void (^)(void))action;
 *
 *
 *  Call Method Argument:
 *      [self doAction:^void(paramsType){}];
 *      [self doAction:^void(){}];
 *
 *
 *  typedef:
 *      typedef returnType (^TypedefName)(paramsType);
 *      TypedefName blockName = ^returnType (paramsType){};
 *
 */

#pragma mark weak self for block
#if !VDWeakifySelf
#define VDWeakifySelf \
__weak __typeof(&*self)vd_weak_object = self

#define VDStrongifySelf \
__strong __typeof(&*vd_weak_object)self = vd_weak_object
#endif

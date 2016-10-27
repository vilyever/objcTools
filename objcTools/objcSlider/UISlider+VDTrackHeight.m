//
//  UISlider+VDTrackHeight.m
//  objcSlider
//
//  Created by Deng on 16/8/8.
//  Copyright © Deng. All rights reserved.
//

#import "UISlider+VDTrackHeight.h"

#import <objc/runtime.h>


@implementation UISlider (VDTrackHeight)

@dynamic vd_trackHeight;

//+ (void)load {
//    method_exchangeImplementations(class_getInstanceMethod(self, @selector(trackRectForBounds:)), class_getInstanceMethod(self, @selector(vd_trackRectForBounds:)));
//}

#pragma mark Constructor


#pragma mark Public Method


#pragma mark Properties
- (CGFloat)vd_trackHeight {
    return [objc_getAssociatedObject(self, @selector(vd_trackHeight)) floatValue];
}

- (void)setVd_trackHeight:(CGFloat)vd_trackHeight {
    objc_setAssociatedObject(self, @selector(vd_trackHeight), @(vd_trackHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsDisplay];
}

#pragma mark Protected Method


#pragma mark Private Method
- (CGRect)vd_trackRectForBounds:(CGRect)bounds {
    CGRect trackRect = [self vd_trackRectForBounds:bounds];
    
    if (self.vd_trackHeight > 0.0f) {
        trackRect.size.height = self.vd_trackHeight;
    }
    return trackRect;
}

@end

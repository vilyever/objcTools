//
//  UIFont+VDSize.m
//  objcFont
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIFont+VDSize.h"

//#import <objc/runtime.h>


@implementation UIFont (VDSize)

#pragma mark Constructor


#pragma mark Public Method
- (CGSize)vd_sizeWithString:(NSString *)string withMaxWidth:(float)maxWidth {
    if (!string || maxWidth <= 0) {
        return CGSizeZero;
    }
    
    NSDictionary *attributes = @{NSFontAttributeName : self};
    CGRect boundingRect = [string boundingRectWithSize:CGSizeMake(maxWidth, HUGE_VALF) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attributes context:nil];
    return boundingRect.size;
}

- (CGSize)vd_sizeWithString:(NSString *)string withMaxWidth:(float)maxWidth withLineBreakMode:(NSLineBreakMode)lineBreakMode {
    if (!string || maxWidth <= 0) {
        return CGSizeZero;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [ [NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = lineBreakMode;
    NSDictionary *attributes = @{NSFontAttributeName : self,
                                 NSParagraphStyleAttributeName : paragraphStyle};
    CGRect boundingRect = [string boundingRectWithSize:CGSizeMake(maxWidth, HUGE_VALF) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attributes context:nil];
    return boundingRect.size;
}

- (UIFont *)vd_resizeFontWithString:(NSString *)string withMaxSize:(CGSize)maxSize {
    if (!string || CGSizeEqualToSize(maxSize, CGSizeZero)) {
        return self;
    }
    
    NSDictionary *attributes = @{NSFontAttributeName:self};
    CGRect boundingRect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    if (boundingRect.size.width > (maxSize.width - 1.0f) || boundingRect.size.height > maxSize.height) {
        NSDictionary *nextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:(self.pointSize - 0.1f) ] };
        CGRect nextBoundingRect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nextAttributes context:nil];
        
        if (nextBoundingRect.size.width > (maxSize.width - 1.0f) || nextBoundingRect.size.height > maxSize.height) {
            return [[UIFont systemFontOfSize:(self.pointSize - 0.1f)] vd_resizeFontWithString:string withMaxSize:maxSize];
        }
        else {
            return self;
        }
    }
    else {
        NSDictionary *nextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:(self.pointSize + 0.1f) ] };
        CGRect nextBoundingRect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nextAttributes context:nil];
        
        if (nextBoundingRect.size.width <= (maxSize.width + 1.0f) && nextBoundingRect.size.height <= maxSize.height) {
            return [[UIFont systemFontOfSize:(self.pointSize + 0.1f)] vd_resizeFontWithString:string withMaxSize:maxSize];
        }
        else {
            return self;
        }
    }
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end

//
//  VDHudMaskView.m
//  objcHud
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "VDHudMaskView.h"
#import "objcWindow.h"
#import "objcView.h"

@interface VDHudMaskView ()

@end


@implementation VDHudMaskView

#pragma mark Public Method
+ (VDHudMaskView *)sharedMaskView {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    } );
    
    return _sharedInstance;
}

+ (void)show {
    [VDWindow vd_addSubviewSpreadAutoLayout:[self sharedMaskView]];
}

+ (void)showWithHudView:(UIView *)hudView {
    [[self sharedMaskView] addSubview:hudView];
    [self show];
}

+ (void)hide {
    [[self sharedMaskView] vd_removeAllSubviews];
    [[self sharedMaskView] removeFromSuperview];
}

+ (void)hideDelay:(NSTimeInterval)delay {
    [self performSelector:@selector(hide) withObject:nil afterDelay:delay];
}

+ (void)hideWithHudView:(UIView *)hudView {
    [hudView removeFromSuperview];
    if ([[self sharedMaskView] subviews].count == 0) {
        [self hide];
    }
}

+ (void)hideWithHudView:(UIView *)hudView delay:(NSTimeInterval)delay {
    [self performSelector:@selector(hideWithHudView:) withObject:hudView afterDelay:delay];
}

#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:150.0f / 255.0f];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    return self;
}

- (void)dealloc {
    
}

- (void)layoutSubviews {
    for (UIView *view in [self.subviews copy]) {
        view.center = CGPointMake(self.bounds.size.width / 2.0f, self.bounds.size.height / 2.0f);
    }
}


#pragma mark IBActions


#pragma mark Delegates


#pragma mark Private Method

@end

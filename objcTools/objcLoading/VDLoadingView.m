//
//  VDLoadingView.m
//  objcLoading
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "VDLoadingView.h"
#import "objcKeyPath.h"

@interface VDLoadingView ()

- (void)__i__initVDLoadingView;

- (void)__i__startAnimation:(BOOL)isResume;
- (void)__i__stopAnimation:(BOOL)isPause;

- (void)__i__appWillResignActive:(NSNotification *)notification;
- (void)__i__appDidEnterBackground:(NSNotification *)notification;
- (void)__i__appWillEnterForeground:(NSNotification *)notification;
- (void)__i__appDidBecomeActive:(NSNotification *)notification;

- (void)__i__stopAnimationWhenBackground;
- (void)__i__tryStartAnimationWhenForeground;

@property (nonatomic, assign) CGFloat lastProgress;
@property (nonatomic, assign) CFTimeInterval lastAnimationBeginTime;
@property (nonatomic, assign) CFTimeInterval lastAnimationAnimatingTime;

@end


@implementation VDLoadingView

#pragma mark Public Method
- (void)startAnimation {
    self.animated = YES;
}

- (void)stopAnimation {
    self.animated = NO;
}

#pragma mark Properties
- (CABasicAnimation *)progressAnimation {
    if (!_progressAnimation) {
        _progressAnimation = [CABasicAnimation animationWithKeyPath:VDKeyPath(((VDLoadingLayer *) self.layer), animatingProgress)];
        _progressAnimation.delegate = self;
        _progressAnimation.fromValue = @0.0;
        _progressAnimation.toValue = @1.0;
        _progressAnimation.repeatCount = 1;
        _progressAnimation.duration = self.progressAnimationDuration;
    }
    
    return _progressAnimation;
}

- (void)setAnimated:(BOOL)animated {
    if (_animated != animated) {
        _animated = animated;
        if (_animated) {
            self.progressAnimationRepeatedTimes = -1;
            [self __i__startAnimation:NO];
        }
        else {
            [self __i__stopAnimation:NO];
        }
    }
}

- (void)setProgressAnimationDuration:(NSTimeInterval)progressAnimationDuration {
    _progressAnimationDuration = progressAnimationDuration;
    self.progressAnimation.duration = _progressAnimationDuration;
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    [self __i__initVDLoadingView];
    self.backgroundColor = [UIColor clearColor];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self __i__initVDLoadingView];
    self.backgroundColor = [UIColor clearColor];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    [self __i__initVDLoadingView];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    
    if (hidden) {
        [self __i__stopAnimationWhenBackground];
    }
    else {
        [self __i__tryStartAnimationWhenForeground];
    }
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    
    if (!self.window) {
        [self __i__stopAnimationWhenBackground];
    }
    else {
        [self __i__tryStartAnimationWhenForeground];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (Class)layerClass {
    return [VDLoadingLayer class];
}

- (void)drawLayer:(VDLoadingLayer *)layer inContext:(CGContextRef)ctx {
    [super drawLayer:layer inContext:ctx];
    
    [((VDLoadingLayer *)self.layer) setAnimatingProgress:layer.animatingProgress];
}


#pragma mark IBActions


#pragma mark Delegates
- (void)animationDidStart:(CAAnimation *)anim {
    self.progressAnimationRepeatedTimes++;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (self.animated && flag) {
        [self __i__startAnimation:NO];
    }
}

#pragma mark Private Method
- (void)__i__initVDLoadingView {
    _progressAnimationDuration = 2;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__appWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__appDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__appWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(__i__appDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)__i__startAnimation:(BOOL)isResume {
    if (self.isHidden
        || !self.window
        || [UIApplication sharedApplication].applicationState != UIApplicationStateActive) {
        return;
    }
    
    if (!self.animated) {
        return;
    }
    
    if ([self.layer animationForKey:VDKeyPath(self, progressAnimation)]) {
        return;
    }
    
    if (isResume) {
        self.progressAnimation.beginTime = CACurrentMediaTime() - self.lastAnimationAnimatingTime;
    }
    else {
        self.progressAnimation.beginTime = CACurrentMediaTime();
        
        self.lastAnimationAnimatingTime = 0;
    }

    self.lastAnimationBeginTime = CACurrentMediaTime();
    
    [self.layer addAnimation:self.progressAnimation forKey:VDKeyPath(self, progressAnimation)];
}

- (void)__i__stopAnimation:(BOOL)isPause {
    if (![self.layer animationForKey:VDKeyPath(self, progressAnimation)]) {
        return;
    }
    
    if (isPause) {
        self.lastAnimationAnimatingTime += CACurrentMediaTime() - self.lastAnimationBeginTime;
    }
    [self.layer removeAnimationForKey:VDKeyPath(self, progressAnimation)];
}

- (void)__i__appWillResignActive:(NSNotification *)notification {
}

- (void)__i__appDidEnterBackground:(NSNotification *)notification {
    [self __i__stopAnimationWhenBackground];
}

- (void)__i__appWillEnterForeground:(NSNotification *)notification {
}

- (void)__i__appDidBecomeActive:(NSNotification *)notification {
    [self __i__tryStartAnimationWhenForeground];
}

- (void)__i__stopAnimationWhenBackground {
    if (self.animated) {
        [self __i__stopAnimation:YES];
    }
}

- (void)__i__tryStartAnimationWhenForeground {
    if (self.animated) {
        [self __i__startAnimation:YES];
    }
}

@end

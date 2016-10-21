//
//  VDLoadingLayer.m
//  objcLoading
//
//  Created by Deng on 16/7/11.
//  Copyright © Deng. All rights reserved.
//

#import "VDLoadingLayer.h"
#import "objcKeyPath.h"


@interface VDLoadingLayer ()



@end


@implementation VDLoadingLayer

@dynamic animatingProgress;


#pragma mark Public Method


#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    return self;
}

- (instancetype)initWithLayer:(id)layer {
    self = [super initWithLayer:layer];
    
//    self.animatingProgress = [layer animatingProgress];
    
    return self;
}

- (void)dealloc {
    
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    VDLoadingLayer *layer;
    if ([key isEqualToString:VDKeyPath(layer, animatingProgress)]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}

#pragma mark Delegates

#pragma mark Private Method

@end

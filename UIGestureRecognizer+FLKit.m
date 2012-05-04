//
//  UIGestureRecognizer+FLKit.m
//  FLKit
//  http://github.com/frenzylabs/FLKit
//
//  Created by Wess Cope on 3/21/12.
//  Copyright (c) 2012 FrenzyLabs. All rights reserved.
//

#import "UIGestureRecognizer+FLKit.h"
#import <objc/runtime.h>

@interface UIGestureRecognizer(Private)
- (void) executeCallback:(id)sender;
@end

@implementation UIGestureRecognizer (FLKit)
+ (id)withCallback:(FLGestureCallback)aCallback
{
    return [[[self class] alloc] initWithCallback:aCallback];
}

- (id)initWithCallback:(FLGestureCallback)aCallback
{
    
    self = [self initWithTarget:self action:@selector(executeCallback:)];
    objc_setAssociatedObject(self, @"FL_CONTROL_CALLBACK", aCallback, OBJC_ASSOCIATION_COPY);
    
    return self;
}

- (void) executeCallback:(id)sender
{
    FLGestureCallback tmpCallback = objc_getAssociatedObject(self, @"FL_CONTROL_CALLBACK");

    if(tmpCallback)
        tmpCallback(self);
}

@end

//
//  UIGestureRecognizer+FLKit.h
//  FLKit
//  http://github.com/frenzylabs/FLKit
// 
//  Created by Wess Cope on 3/21/12.
//  Copyright (c) 2012 FrenzyLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FLGestureCallback)(id sender);

@interface UIGestureRecognizer (FLKit)
+ (id)withCallback:(FLGestureCallback)aCallback;
- (id)initWithCallback:(FLGestureCallback)aCallback;
@end

//
//  WCExampleGridController.h
//  WCGridViewDemo
//
//  Created by Wess Cope on 5/18/12.
//  Copyright (c) 2012 American Business Journals. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WCGridView.h"

@interface WCExampleGridController : UIViewController<WCGridViewDataSource, WCGridViewDelegate>
@property (strong, nonatomic) WCGridView *gridView;
@end

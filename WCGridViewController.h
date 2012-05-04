//
//  WCGridViewController.h
//  StandingHere
//
//  Created by Wess Cope on 5/4/12.
//  Copyright (c) 2012 Wess Cope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCGridView.h"
#import "WCGridViewCell.h"

@interface WCGridViewController : UIViewController<WCGridViewDataSource, WCGridViewDelegate>
@property (nonatomic, strong) WCGridView *gridView;
@end

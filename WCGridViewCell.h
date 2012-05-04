//
//  WCGridViewCell.h
//  StandingHere
//
//  Created by Wess Cope on 5/3/12.
//  Copyright (c) 2012 Wess Cope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WCGridViewCell : UIView
@property (strong, nonatomic) UILabel       *titleLabel;
@property (readonly, nonatomic) NSString    *reuseIdentifier;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;
@end

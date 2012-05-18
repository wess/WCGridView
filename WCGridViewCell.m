//
//  WCGridViewCell.m
//  StandingHere
//
//  Created by Wess Cope on 5/3/12.
//  Copyright (c) 2012 Wess Cope. All rights reserved.
//

#import "WCGridViewCell.h"

@interface WCGridViewCell()
@end

@implementation WCGridViewCell
@synthesize reuseIdentifier = _reuseIdentifier;
@synthesize titleLabel      = _titleLabel;

- (id)init
{
    self = [super initWithFrame:CGRectNull];
    if (self) 
    {
        _titleLabel                 = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_titleLabel];
    }
    return self;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [self init];
    if(self)
    {
        _reuseIdentifier = reuseIdentifier;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _titleLabel.frame = CGRectInset(self.bounds, 10.0f, 10.0f);
}
@end

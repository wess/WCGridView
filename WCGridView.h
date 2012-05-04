//
//  WCGridView.h
//  StandingHere
//
//  Created by Wess Cope on 5/3/12.
//  Copyright (c) 2012 Wess Cope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCGridViewCell.h"
#import "UIGestureRecognizer+FLKit.h"

typedef struct {
    NSInteger row;
    NSInteger column;
} WCGridIndexPath;

@protocol WCGridViewDataSource;
@protocol WCGridViewDelegate;

@interface WCGridView : UIView
@property (strong, nonatomic) id<WCGridViewDataSource>  dataSource;
@property (strong, nonatomic) id<WCGridViewDelegate>    delegate;

- (WCGridViewCell *)dequeueReusableCellWithIdentifier:(NSString *)reuseIdentifier;
- (WCGridIndexPath)indexPathForCell:(WCGridViewCell *)cell;
- (void)reloadData;
@end

@protocol WCGridViewDataSource <NSObject>

- (NSInteger)numberOfRowsForGridView:(WCGridView *)gridView;
- (NSInteger)gridView:(WCGridView *)gridView numberOfColumnsForRowAtIndex:(NSInteger)index;
- (WCGridViewCell *)gridView:(WCGridView *)gridView cellForGridIndexPath:(WCGridIndexPath)indexPath;

@optional
- (CGFloat)gridView:(WCGridView *)gridView heightForRowAtIndex:(NSInteger)index;
@end

@protocol WCGridViewDelegate <NSObject>
@optional
- (void)gridView:(WCGridView *)gridView didSelectCellAtIndexPath:(WCGridIndexPath)indexPath;
@end
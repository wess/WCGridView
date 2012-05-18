//
//  WCGridView.m
//  StandingHere
//
//  Created by Wess Cope on 5/3/12.
//  Copyright (c) 2012 Wess Cope. All rights reserved.
//

#import "WCGridView.h"

static const CGFloat kGridViewDefaultRowHeight = 50.0f;

@interface WCGridView()
{
    NSUInteger          _numberOfRows;
    NSMutableSet        *_cellCache;
    NSMutableDictionary *_cellPaths;
}
@property (strong, nonatomic) UIScrollView *scrollView;

- (void)clearCachedCells;
@end

@implementation WCGridView
@synthesize dataSource      = _dataSource;
@synthesize delegate        = _delegate;
@synthesize scrollView      = _scrollView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        
        _numberOfRows   = 0;
        _cellPaths      = [[NSMutableDictionary alloc] init];
        _scrollView     = [[UIScrollView alloc] initWithFrame:frame];
        
        [self addSubview:_scrollView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearCachedCells) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)reloadData
{
    [self layoutSubviews];
}

#pragma mark - Cell Caching
- (WCGridViewCell *)dequeueReusableCellWithIdentifier:(NSString *)reuseIdentifier
{
    NSSet *filteredCells = [_cellCache filteredSetUsingPredicate:[NSPredicate predicateWithFormat:@"reuseIdentifier == %@", reuseIdentifier]];
    WCGridViewCell *cell = [filteredCells anyObject];
    
    if(cell != nil)
        [_cellCache removeObject:cell];

    return cell;
}

- (void)clearCachedCells
{
    [_cellCache removeAllObjects];
}

#pragma mark - Cell Setup and Layout
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    static NSString *RowIdentifier = @"__WCGridViewRowIdentifier__";
    
    // Hack fix for rotation
    for(UIView *view in _scrollView.subviews)
        [view removeFromSuperview];

    
    _scrollView.frame = self.bounds;

    _numberOfRows = [self.dataSource numberOfRowsForGridView:self];
    
    int currentY        = 0;
    int contentHeight   = 0;

    CGFloat rowHeight = kGridViewDefaultRowHeight;
    
    for(int row = 0; row < _numberOfRows; row++)
    {
        if([self.dataSource respondsToSelector:@selector(gridView:heightForRowAtIndex:)])
            rowHeight = [self.dataSource gridView:self heightForRowAtIndex:row];
            
        CGRect currentRowFrame = CGRectMake(self.frame.origin.x, currentY, self.frame.size.width, rowHeight);
        UIView *rowView = (UIView  *)[self dequeueReusableCellWithIdentifier:RowIdentifier];
        
        if(rowView == nil)
            rowView = [[UIView alloc] initWithFrame:currentRowFrame];
        else
            rowView.frame = currentRowFrame;
        
        NSInteger cols      = [self.dataSource gridView:self numberOfColumnsForRowAtIndex:row];
        CGFloat cellWidth   = (self.frame.size.width / cols);
        
        for(int column = 0; column < cols; column++)
        {
            WCGridIndexPath indexPath;
            indexPath.row       = row;
            indexPath.column    = column;
            indexPath.index     = (row * 2) + column;
            
            WCGridViewCell *cell = [self.dataSource gridView:self cellForGridIndexPath:indexPath];
            cell.frame           = CGRectMake((cellWidth * column), 0.0f, cellWidth, rowHeight);
            cell.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin  | 
                                    UIViewAutoresizingFlexibleTopMargin     |
                                    UIViewAutoresizingFlexibleHeight        | 
                                    UIViewAutoresizingFlexibleLeftMargin    | 
                                    UIViewAutoresizingFlexibleRightMargin   | 
                                    UIViewAutoresizingFlexibleWidth;
            
            [rowView addSubview:cell];
            
            if(cell.reuseIdentifier)
                [_cellCache addObject:cell];
            
            [_cellPaths setObject:[NSValue value:&indexPath withObjCType:@encode(WCGridIndexPath)] forKey:[NSNumber numberWithInt:(int)cell]];
            
            if([self.delegate respondsToSelector:@selector(gridView:didSelectCellAtIndexPath:)])
            {
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithCallback:^(id sender) {
                    [self.delegate gridView:self didSelectCellAtIndexPath:indexPath];
                }];
                
                cell.gestureRecognizers = [NSArray arrayWithObjects:tap, nil];
            }
        }
        
        CGRect rowFrame         = rowView.frame;
        rowFrame.origin.y       = (rowHeight * row);
        rowView.frame           = rowFrame;
        contentHeight          += rowView.frame.size.height;
        
        CGSize contentSize = _scrollView.contentSize;
        contentSize.height = contentHeight;
        
        _scrollView.contentSize = contentSize;
        
        [_scrollView addSubview:rowView];
    }
    
}


#pragma mark - Utlity Methods
- (WCGridIndexPath)indexPathForCell:(WCGridViewCell *)cell
{
    NSValue *indexPathValue = [_cellPaths objectForKey:[NSNumber numberWithInt:(int)cell]];
    WCGridIndexPath indexPath;
    [indexPathValue getValue:&indexPath];
    
    return indexPath;
}

@end




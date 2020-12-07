//
//  WCExampleGridController.m
//  WCGridViewDemo
//
//  Created by Wess Cope on 5/18/12.
//  Copyright (c) 2012 American Business Journals. All rights reserved.
//

#import "WCExampleGridController.h"

UIColor *randomColor()
{
    CGFloat red     =  (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue    = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green   = (CGFloat)random()/(CGFloat)RAND_MAX;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@implementation WCExampleGridController
@synthesize gridView = _gridView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.autoresizesSubviews = YES;
    
    _gridView                   = [[WCGridView alloc] initWithFrame:self.view.bounds];
    _gridView.delegate          = self;
    _gridView.dataSource        = self;
    _gridView.autoresizingMask  = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:_gridView];
}

#pragma mark - GridView DataSource methods
- (NSInteger)numberOfRowsForGridView:(WCGridView *)gridView
{
    return 40;
}

- (NSInteger)gridView:(WCGridView *)gridView numberOfColumnsForRowAtIndex:(NSInteger)index
{
    return 4;
}

- (WCGridViewCell *)gridView:(WCGridView *)gridView cellForGridIndexPath:(WCGridIndexPath)indexPath
{
    static NSString *CellIdentifier = @"GRID_CELL";
    WCGridViewCell *cell = [gridView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
        cell = [[WCGridViewCell alloc] initWithReuseIdentifier:CellIdentifier];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"Row: %ld / Col: %ld / Index: %ld", (long)indexPath.row, (long)indexPath.column, (long)indexPath.index];
    cell.backgroundColor = randomColor();
    
    return cell;
}

- (CGFloat)gridView:(WCGridView *)gridView heightForRowAtIndex:(NSInteger)index
{
    return 60.0f;
}

#pragma mark - GridView Delegate Methods
- (void)gridView:(WCGridView *)gridView didSelectCellAtIndexPath:(WCGridIndexPath)indexPath
{
    NSLog(@"Tapped Row: %ld / Col: %ld / Index: %ld", (long)indexPath.row, (long)indexPath.column, (long)indexPath.index);
}

#pragma mark - Orientation
- (BOOL)shouldAutorotate
{
    return YES;
}




@end

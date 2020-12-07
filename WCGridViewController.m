//
//  WCGridViewController.m
//  StandingHere
//
//  Created by Wess Cope on 5/4/12.
//  Copyright (c) 2012 Wess Cope. All rights reserved.
//

#import "WCGridViewController.h"

@interface WCGridViewController ()

@end

@implementation WCGridViewController
@synthesize gridView = _gridView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
    
    }
    return self;
}

- (void)loadView
{
    _gridView = [[WCGridView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = _gridView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)dealloc
{
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotate
{
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    return (UIInterfaceOrientationIsPortrait(interfaceOrientation));
}

#pragma mark - WCGridView DataSource Methods
- (CGFloat)gridView:(WCGridView *)gridView heightForRowAtIndex:(NSInteger)index
{
    NSLog(@"Override in child");
    return 0;
}

- (NSInteger)numberOfRowsForGridView:(WCGridView *)gridView
{
    NSLog(@"Override in child");
    return 0;
}

- (NSInteger)gridView:(WCGridView *)gridView numberOfColumnsForRowAtIndex:(NSInteger)index
{
    NSLog(@"Override in child");
    return 0;
}


- (WCGridViewCell *)gridView:(WCGridView *)gridView cellForGridIndexPath:(WCGridIndexPath)indexPath
{
    NSLog(@"Override in child");
    static NSString *reuseIdentifier = @"CELL";
    
    WCGridViewCell *cell = (WCGridViewCell *)[gridView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(cell == nil)
        cell = [[WCGridViewCell alloc] initWithReuseIdentifier:reuseIdentifier];
    
    return cell;
}

#pragma mark - WCGridView Delegate Methods
//- (void)gridView:(WCGridView *)gridView didSelectCellAtIndexPath:(WCGridIndexPath)indexPath
//{
//    NSLog(@"ROW: %d // COL: %d", indexPath.row, indexPath.column);    
//}

@end

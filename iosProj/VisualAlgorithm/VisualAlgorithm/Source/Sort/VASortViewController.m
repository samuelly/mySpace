//
//  VASortViewController.m
//  VisualAlgorithm
//
//  Created by zhuqi's mac on 17/3/29.
//  Copyright © 2017年 LemonTree. All rights reserved.
//

#import "VASortViewController.h"

static const int stripCout = 100;

@interface VASortViewController ()

@property (nonatomic, strong) UISegmentedControl *segmentControl;
//@property (nonatomic, assign) NSInteger stripCount;
@property (nonatomic, copy) NSMutableArray *stripArray;

@end

@implementation VASortViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self resetSortView];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Sort Algorithm";
    
    [self.segmentControl setFrame:CGRectMake(15, 64 + 15, self.view.width - 2*15, 30)];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(tag) userInfo:nil repeats:NO];
}

- (UISegmentedControl *)segmentControl
{
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"冒泡",@"并归",@"快排"]];
        _segmentControl.selectedSegmentIndex = 0;
        [_segmentControl addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_segmentControl];
    }
    
    return _segmentControl;
}

- (void)resetSortView
{
    
}

#pragma mark -- Touch Events

- (void)segmentValueChanged:(UISegmentedControl *)segmentControl
{
    BOOL tep;
}

- (void)tag
{
    NSLog(@"11111111111");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  VASortViewController.m
//  VisualAlgorithm
//
//  Created by zhuqi's mac on 17/3/29.
//  Copyright © 2017年 LemonTree. All rights reserved.
//

#import "VASortViewController.h"

@interface VASortViewController ()

@property (nonatomic, strong) UISegmentedControl *segmentControl;

@end

@implementation VASortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Sort Algorithm";
    
    [self.view addSubview:_segmentControl];
}

//- (void)setSegmentControl:(UISegmentedControl *)segmentControl
//{
//
//}

- (UISegmentedControl *)segmentControl
{
    if (!_segmentControl) {
//        _segmentControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 15, self.view., <#CGFloat height#>)]
    }
    
    return _segmentControl;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

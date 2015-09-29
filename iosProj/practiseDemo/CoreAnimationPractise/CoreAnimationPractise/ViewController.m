//
//  ViewController.m
//  CoreAnimationPractise
//
//  Created by zhuqi on 15/9/29.
//  Copyright (c) 2015年 zhuqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView *testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    [self initView];
}

- (void)initView
{
    _testView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, (self.view.frame.size.height-200)/2, 200, 200)];
    _testView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_testView];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [_testView.layer addSublayer:blueLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

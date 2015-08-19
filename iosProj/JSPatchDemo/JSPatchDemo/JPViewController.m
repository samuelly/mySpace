//
//  JPViewController.m
//  JSPatchDemo
//
//  Created by zhuqi on 15/7/30.
//  Copyright (c) 2015年 zhuqi. All rights reserved.
//

#import "JPViewController.h"

@interface JPViewController ()

@end

@implementation JPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"JSPatch Demo";
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    [self initBtn];
}

- (void)initBtn
{
    _changeColorBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect r = CGRectMake((self.view.frame.size.width - 80)/2, 100, 80, 44);
    _changeColorBtn.frame = r;
    [_changeColorBtn setTitle:@"切换颜色" forState:UIControlStateNormal];
    [_changeColorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_changeColorBtn setBackgroundColor:[UIColor whiteColor]];
    _changeColorBtn.layer.cornerRadius = 3;
    [_changeColorBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_changeColorBtn];
    
}

- (void)btnPressed:(UIButton *)sender
{
    NSLog(@"btn pressed.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

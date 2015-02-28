//
//  SecondTabViewController.m
//  Box
//
//  Created by zhuqi on 14/10/10.
//  Copyright (c) 2014年 zhuqi. All rights reserved.
//

#import "SecondTabViewController.h"
#import "UIApplication+Delegate.h"

@interface SecondTabViewController ()

@end

@implementation SecondTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor = [UIColor blueColor];
    [UIApplication thisApp].tabBarViewController.title = @"Look this";
    [self initLabel];
}

- (void)viewWillAppear:(BOOL)animated
{
    [UIApplication thisApp].tabBarViewController.title = @"Look this";
}

- (void)initLabel {
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(kDeviceWidth/2-50, kDeviceHeight/2-20, 100, 40)];
    _titleLbl.text = @"SecondView";
    _titleLbl.font = kAppFont(18);
    [self.view addSubview:_titleLbl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

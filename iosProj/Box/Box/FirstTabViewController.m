//
//  FirstTabViewController.m
//  Box
//
//  Created by zhuqi on 14/10/10.
//  Copyright (c) 2014年 zhuqi. All rights reserved.
//

#import "FirstTabViewController.h"
#import "UIApplication+Delegate.h"

@interface FirstTabViewController ()

@end

@implementation FirstTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    [self initLabel];
}

- (void)viewWillAppear:(BOOL)animated
{
    [UIApplication thisApp].tabBarViewController.title = @"Hey guys";
}

- (void)initLabel {
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(kDeviceWidth/2-50, kDeviceHeight/2-20, 100, 40)];
    _titleLbl.text = @"FirstView";
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

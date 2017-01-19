//
//  YASettingsViewController.m
//  Your Air
//
//  Created by zhuqi on 17/1/10.
//  Copyright © 2017年 zhuqi. All rights reserved.
//

#import "YASettingsViewController.h"

@interface YASettingsViewController ()

@end

@implementation YASettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(backToHome)];
    self.navigationItem.rightBarButtonItem = backBtn;
    
    self.title = @"Setting";
    self.view.backgroundColor = kDefaultViewBackgroundColor;
}

- (void)viewWillAppear:(BOOL)animated
{

}


#pragma mark - ****************************click events****************************
- (void)backToHome
{
    CATransition *animation = [CATransition animation];
    animation.type = @"oglFlip";
    animation.subtype = @"fromRight";
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    //把默认的动画关闭，虽然有些动画不受影响，但有的会和默认动画叠加
    [self.navigationController popViewControllerAnimated:NO];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

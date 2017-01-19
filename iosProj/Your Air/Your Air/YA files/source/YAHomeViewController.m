//
//  YAHomeViewController.m
//  Your Air
//
//  Created by zhuqi on 17/1/9.
//  Copyright © 2017年 zhuqi. All rights reserved.
//

#import "YAHomeViewController.h"
#import "AFHTTPSessionManager.h"
#import "YASettingsViewController.h"

#import "YYModel.h"
#import "YAAqicnDataModel.h"

@interface YAHomeViewController ()

@end

@implementation YAHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kDefaultViewBackgroundColor;
    self.title = @"Your Air";
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.backgroundColor=[UIColor orangeColor];
    leftBtn.frame=CGRectMake(0, 0, 30, 30);
    //    [leftBtn setTitle:@"JUMP TO SECOND" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(goSetting) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self requestData];
    
}

- (void)viewWillAppear:(BOOL)animated
{

}

- (void)requestData
{
    NSString *url = [NSString stringWithFormat:@"https://api.waqi.info/feed/here/?token=%@",kUserToken];
    
    [[YANetworkingHandler sharedInstance] post:url parameters:nil onSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject) {
            aqicnModel *model = [aqicnModel yy_modelWithJSON:responseObject];
            NSLog(@"the url is %@",[model.data.iaqi.pm25 objectForKey:@"v"]);
            NSLog(@"%@", responseObject);
            self.title = [NSString stringWithFormat:@"PM2.5 : %d",[model.data.aqi intValue]];
        }
    } onFailure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"request failure");
    }];
}

#pragma mark - ****************************click events****************************
- (void)goSetting
{
    YASettingsViewController *settingVC = [[YASettingsViewController alloc] init];
    CATransition *animation = [CATransition animation];
    animation.type = @"oglFlip";
    animation.subtype = @"fromLeft";
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    [self.navigationController pushViewController:settingVC animated:NO];
}

@end

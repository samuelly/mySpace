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
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"Your Air";
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.backgroundColor=[UIColor orangeColor];
    leftBtn.frame=CGRectMake(0, 0, 30, 30);
    //    [leftBtn setTitle:@"JUMP TO SECOND" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(jumpToSetting) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self requestData];
    
}

- (void)viewWillAppear:(BOOL)animated
{

}

- (void)requestData
{
    NSString *location = [NSString stringWithFormat:@"https://api.waqi.info/feed/here/?token=%@",kUserToken];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:location];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            aqicnModel *model = [aqicnModel yy_modelWithJSON:responseObject];
            NSLog(@"the url is %@",[model.data.iaqi.pm25 objectForKey:@"v"]);
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [dataTask resume];
}

#pragma mark - ****************************click events****************************
- (void)jumpToSetting
{
    YASettingsViewController *settingVC = [[YASettingsViewController alloc] init];
    CATransition *animation = [CATransition animation];
    animation.type = @"oglFlip";
    animation.subtype = @"fromLeft";
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    [self.navigationController pushViewController:settingVC animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

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

@interface YAHomeViewController () <UIScrollViewDelegate>

@end

@implementation YAHomeViewController
{
    UIScrollView *_mainScrollView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    return self;
}

#pragma mark - **************************** Life Cycle ****************************
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kDefaultViewBackgroundColor;
    self.title = @"Your Air";
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.backgroundColor=[UIColor orangeColor];
    leftBtn.frame=CGRectMake(0, 0, 30, 30);
    [leftBtn addTarget:self action:@selector(goSetting) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self requestData];
    
    [self setupUI];
    
}

- (void)viewWillAppear:(BOOL)animated
{

}

#pragma mark - **************************** UI Layout ****************************
- (void)setupUI
{
    _mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _mainScrollView.delegate = self;
    [_mainScrollView setContentSize:CGSizeMake(self.view.width, self.view.height + 20)];
    [_mainScrollView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    _mainScrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_mainScrollView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(kMargin, kMargin, self.view.width - 2*kMargin, 20)];
    title.backgroundColor = [UIColor whiteColor];
    title.text = [NSString stringWithFormat:@"今日PM2.5指数："];
    title.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:title];
    
}

#pragma mark - **************************** Request Data ****************************
- (void)requestData
{
    NSString *url = [NSString stringWithFormat:@"https://api.waqi.info/feed/here/?token=%@",kUserToken];
    NSString *url2 = [NSString stringWithFormat:@"https://api.waqi.info/feed/nanjing/?token=%@",kUserToken];

    
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

#pragma mark - **************************** Click Events ****************************
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

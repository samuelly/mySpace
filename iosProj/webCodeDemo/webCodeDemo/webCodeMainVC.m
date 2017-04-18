//
//  webCodeMainVC.m
//  webCodeDemo
//
//  Created by zhuqi on 17/4/18.
//  Copyright © 2017年 com.lemonTree. All rights reserved.
//

#import "webCodeMainVC.h"
#import "webViewController.h"

static const CGFloat BTN_WIDTH = 100;
static const CGFloat BTN_HEIGHT = 44;

@interface webCodeMainVC ()

@end

@implementation webCodeMainVC
{
    UIButton *_startBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}


- (void)setupUI
{
    _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_startBtn setFrame:CGRectMake((self.view.frame.size.width - BTN_WIDTH) / 2, (self.view.frame.size.height - BTN_HEIGHT) / 2 , BTN_WIDTH, BTN_HEIGHT)];
    [_startBtn setTitle:@"Let's GO" forState:UIControlStateNormal];
    [_startBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [_startBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _startBtn.layer.borderWidth = 1;
    [_startBtn addTarget:self action:@selector(goWebCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_startBtn];
}

- (void)goWebCode
{
    webViewController *webVC = [[webViewController alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
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

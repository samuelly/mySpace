//
//  ViewController.m
//  webCodeDemo
//
//  Created by zhuqi on 17/4/17.
//  Copyright © 2017年 com.lemonTree. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

static const CGFloat BTN_WIDTH = 100;
static const CGFloat BTN_HEIGHT = 44;

@interface ViewController ()
@end

@implementation ViewController
{
    UIButton *_startBtn;
    WKWebView *_webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
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
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    _webView.navigationDelegate = self;
    // 2.创建请求
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.bing.com"]];
    // 3.加载网页
    [_webView loadRequest:request];
    
    // 最后将webView添加到界面
    [self.view addSubview:_webView];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - WKWebView WKNavigationDelegate 相关
/// 是否允许加载网页 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSString *urlString = [[navigationAction.request URL] absoluteString];
    
    urlString = [urlString stringByRemovingPercentEncoding];
    //    NSLog(@"urlString=%@",urlString);
    // 用://截取字符串
    NSArray *urlComps = [urlString componentsSeparatedByString:@"://"];
    if ([urlComps count]) {
        // 获取协议头
        NSString *protocolHead = [urlComps objectAtIndex:0];
        NSLog(@"protocolHead=%@",protocolHead);
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
 */

@end

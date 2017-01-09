//
//  YAHomeViewController.m
//  Your Air
//
//  Created by zhuqi on 17/1/9.
//  Copyright © 2017年 zhuqi. All rights reserved.
//

#import "YAHomeViewController.h"
#import "AFHTTPSessionManager.h"

@interface YAHomeViewController ()

@end

@implementation YAHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self requestData];
}

- (void)requestData
{
    NSString *token = @"a38f44fd94b0d3a034074c813f550cb15e9f50ef";
    NSString *location = [NSString stringWithFormat:@"https://api.waqi.info/feed/here/?token=%@",token];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:location];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [dataTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

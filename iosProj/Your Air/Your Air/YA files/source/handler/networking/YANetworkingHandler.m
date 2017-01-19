//
//  YANetworkingHandler.m
//  Your Air
//
//  Created by zhuqi on 17/1/19.
//  Copyright © 2017年 zhuqi. All rights reserved.
//

#import "YANetworkingHandler.h"
#import "AFHTTPSessionManager.h"

@implementation YANetworkingHandler

+ (YANetworkingHandler *)sharedInstance
{
    static YANetworkingHandler *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YANetworkingHandler alloc] init];
    });
    
    return instance;
}

- (void)post:(NSString *)requestURL
  parameters:(id)parameters
   onSuccess:(void (^)(NSURLSessionDataTask *task, id responseObject))success
   onFailure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [manager POST:requestURL parameters:nil progress:nil success:success failure:failure];
}


@end

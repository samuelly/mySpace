//
//  YANetworkingHandler.h
//  Your Air
//
//  Created by zhuqi on 17/1/19.
//  Copyright © 2017年 zhuqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YANetworkingHandler : NSObject

+ (YANetworkingHandler *)sharedInstance;

- (void)post:(NSString *)requestURL
  parameters:(id)parameters
   onSuccess:(void (^)(NSURLSessionDataTask *task, id responseObject))success
   onFailure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end

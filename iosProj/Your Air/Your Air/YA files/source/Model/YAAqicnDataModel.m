//
//  YAAqicnDataModel.m
//  Your Air
//
//  Created by zhuqi on 17/1/16.
//  Copyright © 2017年 zhuqi. All rights reserved.
//

#import "YAAqicnDataModel.h"

@implementation timeResponseModel
@end

@implementation iaqiResponsModel
@end

@implementation cityResponseModel
@end

@implementation aqicnModel
@end

@implementation dataResponseModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributions" : [attributionsResponseModel class]};
}
@end

@implementation attributionsResponseModel
@end

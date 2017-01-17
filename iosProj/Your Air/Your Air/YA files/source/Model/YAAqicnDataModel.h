//
//  YAAqicnDataModel.h
//  Your Air
//
//  Created by zhuqi on 17/1/16.
//  Copyright © 2017年 zhuqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface timeResponseModel : NSObject
@property (nonatomic, copy) NSString *s;
@property (nonatomic, copy) NSString *tz;
@property (nonatomic, copy) NSString *v;
@end

@interface iaqiResponsModel : NSObject
@property (nonatomic, copy) NSDictionary *pm25;
@property (nonatomic, copy) NSDictionary *pm10;
@property (nonatomic, copy) NSDictionary *co;
@property (nonatomic, copy) NSDictionary *so2;
@property (nonatomic, copy) NSDictionary *no2;
@property (nonatomic, copy) NSDictionary *o3;
@property (nonatomic, copy) NSDictionary *p;
@property (nonatomic, copy) NSDictionary *t;
@property (nonatomic, copy) NSDictionary *d;
@property (nonatomic, copy) NSDictionary *h;
@property (nonatomic, copy) NSDictionary *w;
@end

@interface cityResponseModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *geo;
@end

@interface attributionsResponseModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@end

@interface dataResponseModel : NSObject
@property (nonatomic, strong) NSNumber *idx;
@property (nonatomic, strong) NSNumber *aqi;
@property (nonatomic, strong) NSArray *attributions;  // Array<attributionsResponseModel>
@property (nonatomic, strong) cityResponseModel *city;
@property (nonatomic, strong) iaqiResponsModel *iaqi;
@property (nonatomic, strong) timeResponseModel *time;
@end

@interface aqicnModel : NSObject
@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) dataResponseModel *data;
@end

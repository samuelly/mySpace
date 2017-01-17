//
//  YAConstants.h
//  Your Air
//
//  Created by zhuqi on 17/1/10.
//  Copyright © 2017年 zhuqi. All rights reserved.
//

#ifndef YAConstants_h
#define YAConstants_h

#ifndef kRGB
#define kRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#endif

#ifndef kRGBA
#define kRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#endif

#define kAirPollutionGoodColor          kRGB(52.0, 152.0, 102.0)  // 0-50
#define kAirPollutionModerateColor      kRGB(250.0, 220.0, 61.0)  // 51-100
#define kAirPollutionLessUnhealthy      kRGB(246.0, 152.0, 59.0)  // 101-150
#define kAirPollutionUnhealthy          kRGB(193.0, 1.0, 54.0)    // 151-200
#define kAirPollutionVeryUnhealthy      kRGB(98.0, 17.0, 152.0)   // 201-300
#define kAirPollutionHazardous          kRGB(119.0, 1.0, 37.0)    // 300+


#define kUserToken @"a38f44fd94b0d3a034074c813f550cb15e9f50ef"

#endif /* YAConstants_h */

//
//  UIApplication+Delegate.m
//  Box
//
//  Created by zhuqi on 14/10/15.
//  Copyright (c) 2014年 zhuqi. All rights reserved.
//

#import "UIApplication+Delegate.h"

@implementation UIApplication (Delegate)

+ (AppDelegate *)thisApp
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
@end

//
//  AppDelegate.h
//  Box
//
//  Created by zhuqi on 14/10/10.
//  Copyright (c) 2014年 zhuqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *tabBarViewController;
@property (strong, nonatomic) UINavigationController *navigationVC;

- (void)setTabBarViewController;
@end




//
//  AppDelegate.m
//  Box
//
//  Created by zhuqi on 14/10/10.
//  Copyright (c) 2014年 zhuqi. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstTabViewController.h"
#import "SecondTabViewController.h"
#import "ThirdTabViewController.h"
//#import "Constants.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.navigationVC = [[UINavigationController alloc]init];
    self.window.backgroundColor = kWhiteColor;
    
    [self setTabBarViewController];
    self.window.rootViewController = self.navigationVC;
    [self.navigationVC setViewControllers:@[self.tabBarViewController]];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)setTabBarViewController {
    _tabBarViewController = [[MainViewController alloc]init];
    FirstTabViewController *firstTabVC = [[FirstTabViewController alloc]init];
    SecondTabViewController *secondTabVC = [[SecondTabViewController alloc]init];
    ThirdTabViewController *thirdTabVC = [[ThirdTabViewController alloc]initWithNibName:@"ThirdTabViewController" bundle:nil];
    
    NSArray *tabViewArry = [NSArray arrayWithObjects:firstTabVC,secondTabVC,thirdTabVC,nil];
    [_tabBarViewController setViewControllers:tabViewArry animated:YES];
    _tabBarViewController.selectedIndex = 1;
    
    UITabBar *boxTabBar = _tabBarViewController.tabBar;
    boxTabBar.tintColor = [UIColor orangeColor];
    boxTabBar.barTintColor = [UIColor blackColor];
    //boxTabBar.barStyle = UIBarStyleBlack;
    //boxTabBar.translucent = YES;
    
    UITabBarItem *firstTabBarItem = [boxTabBar.items objectAtIndex:0];
    UITabBarItem *secondTabBarItem = [boxTabBar.items objectAtIndex:1];
    UITabBarItem *thirdTavBarItem = [boxTabBar.items objectAtIndex:2];
    firstTabBarItem.title = @"firstTab";
    secondTabBarItem.title = @"secondTab";
    thirdTavBarItem.title = @"thirdTab";
    firstTabBarItem.image = [UIImage imageNamed:@"tabbar_ic_agent_org@2x"];
    secondTabBarItem.image = [UIImage imageNamed:@"tabbar_ic_post_org@2x"];
    thirdTavBarItem.image = [UIImage imageNamed:@"tabbar_ic_search_org@2x"];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

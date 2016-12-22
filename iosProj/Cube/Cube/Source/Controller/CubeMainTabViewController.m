//
//  CubeMainTabViewController.m
//  Cube
//
//  Created by zhuqi on 16/12/9.
//  Copyright © 2016年 zhuqi. All rights reserved.
//

#import "CubeMainTabViewController.h"

@interface CubeMainTabViewController ()

@end

@implementation CubeMainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"test";
    
    [self setupTabViews];
}

- (void)setupTabViews
{
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.title = @"左边";
    vc1.view.backgroundColor = [UIColor orangeColor];
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:vc1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.title = @"中间";
    vc2.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.title = @"右边";
    vc3.view.backgroundColor = [UIColor greenColor];
    
    self.viewControllers = @[naVC,vc2,vc3];
    
    self.selectedIndex = 2;
    
//    self.navigationController.navigationBar.hidden = YES;
    
    UITabBar *tabBar = self.tabBar;
    tabBar.barStyle = UIBarStyleDefault;
//    tabBar.barTintColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

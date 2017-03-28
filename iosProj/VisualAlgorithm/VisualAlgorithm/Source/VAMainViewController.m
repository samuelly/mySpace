//
//  VAMainViewController.m
//  VisualAlgorithm
//
//  Created by zhuqi's mac on 17/3/28.
//  Copyright © 2017年 LemonTree. All rights reserved.
//

#import "VAMainViewController.h"

@interface VAMainViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation VAMainViewController
{
    UITableView *_mainTableView;
    NSArray *_nameArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Visual Algorithm";
    
    _nameArray = [NSArray arrayWithObjects:@"sort", @"unknow",  @"unknown", nil];
    
    [self initTableView];
}

- (void)initTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [self.view addSubview:_mainTableView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableView Delegate & DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_nameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [_nameArray objectAtIndex:indexPath.row];
    
    return cell;
}

@end

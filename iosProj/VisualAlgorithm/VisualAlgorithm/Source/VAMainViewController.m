//
//  VAMainViewController.m
//  VisualAlgorithm
//
//  Created by zhuqi's mac on 17/3/28.
//  Copyright © 2017年 LemonTree. All rights reserved.
//

#import "VAMainViewController.h"
#import "VASortViewController.h"


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
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_nameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [_nameArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            VASortViewController *sortVC = [[VASortViewController alloc] init];
            [self.navigationController pushViewController:sortVC animated:YES];
        }
            break;
            
        case 1:
            break;
            
        default:
            break;
    }
}

@end

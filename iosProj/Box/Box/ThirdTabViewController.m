//
//  ThirdTabViewController.m
//  Box
//
//  Created by zhuqi on 14/10/11.
//  Copyright (c) 2014年 zhuqi. All rights reserved.
//

#import "ThirdTabViewController.h"
#import "FYBInviteFriendsVC.h"
#import "UIApplication+Delegate.h"
#import "SwipeableCellVC.h"
#import "CollectionViewController.h"

@interface ThirdTabViewController () <UITableViewDelegate,UITableViewDataSource> 

@end

@implementation ThirdTabViewController {
    NSArray *tableData;
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _thirdTabTableView.dataSource = self;
    _thirdTabTableView.delegate = self;
    //_thirdTabTableView.
    
    [self initData];
    [self initButtons];
    
}

- (void)barBtnPressed:(UIBarButtonItem *)sender
{
    NSLog(@"press me....");
    _sendMsgBtn.hidden = !_sendMsgBtn.hidden;
}

- (void)viewWillAppear:(BOOL)animated
{
    [UIApplication thisApp].tabBarViewController.title = @"Features";
    [UIApplication thisApp].tabBarViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"setHidden" style:UIBarButtonItemStylePlain target:self action:@selector(barBtnPressed:)];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [UIApplication thisApp].tabBarViewController.navigationItem.rightBarButtonItem = nil;
}

- (void)initData {
    tableData = [NSArray arrayWithObjects:@"Collection View", @"Bill Gates", @"John Kamark", @"Samuel Zesse", nil];
}

- (void)initButtons {
    [_sendMsgBtn addTarget:self action:@selector(onBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    _sendMsgBtn.hidden = YES;
    
    [_swipeCellBtn addTarget:self action:@selector(onSwipeCellBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_swipeCellBtn.layer setCornerRadius:4.0];
}



- (void)onBtnPressed:(UIButton* )btn {
    FYBInviteFriendsVC *inviteContacts = [[FYBInviteFriendsVC alloc]init];
    [self.navigationController pushViewController:inviteContacts animated:YES];
}

- (void)onSwipeCellBtnPressed:(UIButton* )btn {
    SwipeableCellVC *swipeableCellView = [[SwipeableCellVC alloc] init];
    [self.navigationController pushViewController:swipeableCellView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"tableview_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            CollectionViewController *collectionview = [[CollectionViewController alloc] initWithCollectionViewLayout:nil];
            [self.navigationController pushViewController:collectionview animated:YES];
            break;
        }
            
        default:
            break;
    }
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

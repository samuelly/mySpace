//
//  DynamicHeightCellVC.m
//  Box
//
//  Created by zhuqi on 16/12/28.
//  Copyright © 2016年 zhuqi. All rights reserved.
//

#import "DynamicHeightCellVC.h"
#import "DynamicHeightCell.h"

@interface DynamicHeightCellVC ()

@end

@implementation DynamicHeightCellVC
{
    NSArray *_textData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
//    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 100.0f)];
//    [self.refreshControl addTarget:self action:@selector(reload:) forControlEvents:UIControlEventValueChanged];
//    [self.refreshControl setTintColor:kGreenColor];
//    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"刷新一下"];
//    [self.tableView.tableHeaderView addSubview:self.refreshControl];
}

//- (void)reload:(__unused id)sender {
//
//}

- (void)setupUI
{
    self.view.backgroundColor = kRedColor;
    self.tableView.rowHeight = 70.0f;
    
    _textData = @[@"hello",
                  @"world",
                  @"AIDS Care Service closes care home, says needs are changing for HIV-positive population",
                  @"'Star Wars' actress and author Carrie Fisher dies at 60",
                  @"Bridge to the past",
                  @"Carrie Fisher, a daughter of Hollywood royalty who gained pop-culture fame as Princess Leia in the original “Star Wars” and turned her struggles with addiction and mental illness into wickedly funny books, a hit film and a one-woman stage show, died Tuesday after falling ill aboard a flight last week. She was 60.",
                  @"In a 2009 interview with The Associated Press, Fisher wasn’t coy about revealing details about her life. She hoped to remove the stigma from mental illness.\
                  \
                  \
                  “People relate to aspects of my stories and that’s nice for me because then I’m not all alone with it,” she said. “Also, I do believe you’re only as sick as your secrets. If that’s true, I’m just really healthy.”",
                 ];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _textData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [DynamicHeightCell heightForCellWithText:[_textData objectAtIndex:indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"dynamicHeightCellIdentifier";
    
    DynamicHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[DynamicHeightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.userText = [_textData objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

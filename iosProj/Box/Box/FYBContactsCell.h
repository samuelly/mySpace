//
//  FYBContactsCell.h
//  Fybao
//
//  Created by zhuqi on 14/7/23.
//  Copyright (c) 2014年 fyb. All rights reserved.
//

#import <UIKit/UIKit.h>


#define EDGE_MARGIN 10.0f
#define CHECK_BUTTON_WIDTH 44
#define CELL_HEIGHT 60

@class FYBContactsCell;

@protocol FYBContactsCellDelegate;

typedef void (^SelectBlock)(UIButton* btn, FYBContactsCell* cell);

@interface FYBContactsCell : UITableViewCell
{
    UILabel *nameLbl,*phoneNumber;
}
@property (nonatomic, assign)id<FYBContactsCellDelegate> delegate;
@property (nonatomic, strong) UIButton *checkBtn;
//@property (nonatomic, strong)NSString *phoneNumForSent;
//@property (nonatomic, copy)SelectBlock selectBlock;

- (void)showWithData:(NSObject *)data;
@end

@protocol FYBContactsCellDelegate <NSObject>

@optional
- (void)checkStatusChanged:(FYBContactsCell *)cell andButton:(UIButton *)btn;
@end

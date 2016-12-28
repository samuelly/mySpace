//
//  FYBContactsCell.m
//  Fybao
//
//  Created by zhuqi on 14/7/23.
//  Copyright (c) 2014年 fyb. All rights reserved.
//

#import "FYBContactsCell.h"
#import "FYBPhoneContacts.h"



@implementation FYBContactsCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, CELL_HEIGHT)];
        containerView.backgroundColor = kWhiteColor;
        [self.contentView addSubview:containerView];
        
        nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_MARGIN, 7, 200, 16)];
        [nameLbl setTextColor:kBlackColor];
        nameLbl.font = kAppFont(16);
        [containerView addSubview:nameLbl];
        
        phoneNumber = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_MARGIN, CELL_HEIGHT/2+7, 200, 16)];
        [phoneNumber setTextColor:kBlackColor];
        phoneNumber.font = kAppFont(16);
        [containerView addSubview:phoneNumber];
        
        _checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _checkBtn.frame = CGRectMake(kDeviceWidth-30-CHECK_BUTTON_WIDTH, (CELL_HEIGHT-CHECK_BUTTON_WIDTH)/2, CHECK_BUTTON_WIDTH, CHECK_BUTTON_WIDTH);
        [_checkBtn setImage:[UIImage imageNamed:@"checkbox_unchecked"] forState:UIControlStateNormal];
        [_checkBtn setImage:[UIImage imageNamed:@"checkbox_checked"] forState:UIControlStateSelected];
        //[checkBtn setImage:[UIImage imageNamed:@"uncheck_dis"] forState:UIControlStateDisabled];
        [_checkBtn addTarget:self action:@selector(checkBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [containerView addSubview:_checkBtn];
    }
    return self;
}

- (void)checkBtnPressed:(UIButton *)btn {
    //btn.selected = !btn.selected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(checkStatusChanged:andButton:)]) {
        [self.delegate checkStatusChanged:self andButton:btn];
    }
}

- (void) showWithData:(NSObject *)data{
    if ([data isKindOfClass:[FYBPhoneContacts class]]) {
        FYBPhoneContacts *contacts = (FYBPhoneContacts *)data;
        if ([contacts.lastName length] > 0 && [contacts.firstName length] > 0) {
            nameLbl.text = [NSString stringWithFormat:@"%@ %@",contacts.lastName,contacts.firstName];
        } else if ([contacts.lastName length] == 0 || [contacts.firstName length] == 0) {
            nameLbl.text = [NSString stringWithFormat:@"%@",([contacts.lastName length] == 0)?contacts.firstName:contacts.lastName];
        }
        phoneNumber.text = contacts.phoneNumber;
        [_checkBtn setSelected:contacts.isSelected];
        
        //self.phoneNumForSent = contacts.phoneNumber;
    }
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end

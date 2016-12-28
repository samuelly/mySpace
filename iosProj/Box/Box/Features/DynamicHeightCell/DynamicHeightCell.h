//
//  DynamicHeightCell.h
//  Box
//
//  Created by zhuqi on 16/12/28.
//  Copyright © 2016年 zhuqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicHeightCell : UITableViewCell

@property (nonatomic, strong) NSString *userText;

+ (CGFloat)heightForCellWithText:(NSString *)text;

@end

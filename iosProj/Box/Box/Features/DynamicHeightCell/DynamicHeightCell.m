//
//  DynamicHeightCell.m
//  Box
//
//  Created by zhuqi on 16/12/28.
//  Copyright © 2016年 zhuqi. All rights reserved.
//

#import "DynamicHeightCell.h"

@implementation DynamicHeightCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.textLabel.textColor = [UIColor darkGrayColor];
    self.textLabel.numberOfLines = 0;
    
    return self;
}

- (void)setUserText:(NSString *)text
{
    _userText = text;
    
    self.textLabel.text = _userText;
    
//    [self setNeedsLayout];
}

+ (CGFloat)heightForCellWithText:(NSString *)text
{
    return MAX(70.0f, [self getTextHeight:text] + 45.0f);
}

+ (CGFloat)getTextHeight:(NSString *)text
{
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(240, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kAppFont(14)} context:nil];
    
    return rectToFit.size.height;
}

#pragma mark - UIView

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    CGRect textFrame = self.textLabel.frame;
//    CGFloat textHeight = [[self class] heightForCellWithText:_userText];
//    textFrame.size.height = textHeight;
//    self.textLabel.frame = textFrame;
//}

@end

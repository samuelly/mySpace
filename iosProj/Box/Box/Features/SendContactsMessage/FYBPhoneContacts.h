//
//  FYBPhoneContacts.h
//  Fybao
//
//  Created by zhuqi on 14/7/18.
//  Copyright (c) 2014年 fyb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYBPhoneContacts : NSObject
{
    
}
@property (nonatomic,strong) NSString *firstName;
@property (nonatomic,strong) NSString *lastName;
@property (nonatomic,strong) NSString *phoneNumber;
@property (nonatomic,assign) BOOL isSelected;

@end
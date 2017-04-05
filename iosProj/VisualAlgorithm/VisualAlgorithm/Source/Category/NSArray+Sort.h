//
//  NSArray+Sort.h
//  VisualAlgorithm
//
//  Created by zhuqi on 17/4/1.
//  Copyright © 2017年 LemonTree. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^swapCallback)(NSUInteger stripArrayIdx1,NSUInteger stripArrayIdx2);

@interface NSArray (Sort)

- (void)startBubbleSort:(NSArray<UIView *> *)stripArray callBack:(swapCallback)swapCallback;
- (void)swap;

@end

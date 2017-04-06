//
//  NSArray+Sort.m
//  VisualAlgorithm
//
//  Created by zhuqi on 17/4/1.
//  Copyright © 2017年 LemonTree. All rights reserved.
//

#import "NSArray+Sort.h"

@implementation NSArray (Sort)

- (void)startBubbleSort:(NSMutableArray<UIView *> *)stripArray callBack:(swapCallback)swapCallback
{
    for (NSUInteger i = 1; i < stripArray.count; i++ ) {
        for (NSUInteger j = stripArray.count - 1; j >= i; j-- ) {
            if (stripArray[j].height < stripArray[j - 1].height) {
                swapCallback(j,j-1);
                UIView *temp = stripArray[j];
                stripArray[j] = stripArray[j-1];
                stripArray[j-1] = temp;
            }
        }
    }
}


- (void)swap
{
    int idx1 = 10;
    int idx2 = 40;
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView *view1 = self[idx1];
        UIView *view2 = self[idx2];
        CGFloat position1 = view1.origin.x;
        CGFloat position2 = view2.origin.x;
        
        [view1 setOrigin:CGPointMake(position2, view1.origin.y)];
        [view2 setOrigin:CGPointMake(position1, view2.origin.y)];
        
    }];
    

}


//for (int i = 1; i < msq.length; i++)
//{
//    for (int j = msq.length - 1; j >= i; j-- ) // mention:it begins from the bottom of the list,from bottom to the top.
//    {
//        if (msq.r[j-1] > msq.r[j])
//            swap(msq,j-1,j); //mention:not use '&msq',it's wrong
//    }
//}
@end

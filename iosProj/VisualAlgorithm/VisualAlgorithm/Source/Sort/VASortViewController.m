//
//  VASortViewController.m
//  VisualAlgorithm
//
//  Created by zhuqi's mac on 17/3/29.
//  Copyright © 2017年 LemonTree. All rights reserved.
//

#import "VASortViewController.h"
#import "NSArray+Sort.h"

static const int stripCount = 100;
static const CGFloat kMargin = 15.0f;
static const CGFloat stripGap = 1.0f;

@interface VASortViewController ()

@property (nonatomic, strong) UISegmentedControl *segmentControl;
//@property (nonatomic, assign) NSInteger stripCount;
@property (nonatomic, copy) NSMutableArray <UIView *> *stripArray;

@end

@implementation VASortViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self resetSortView];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Sort Algorithm";
    
    [self.segmentControl setFrame:CGRectMake(kMargin, 64 + kMargin, self.view.width - 2*kMargin, 30)];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(tag) userInfo:nil repeats:NO];
}

- (UISegmentedControl *)segmentControl
{
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"冒泡",@"并归",@"快排"]];
        _segmentControl.selectedSegmentIndex = 0;
        [_segmentControl addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_segmentControl];
    }
    
    return _segmentControl;
}

- (void)resetSortView
{
    if (!_stripArray) {
        _stripArray = [NSMutableArray arrayWithCapacity:stripCount];
        for (int i = 0; i < stripCount; i++ ) {
            UIView *stripView = [[UIView alloc] init];
            [_stripArray addObject:stripView];
        }
    }
    
    CGFloat width = (self.view.width - 2*kMargin - (stripCount - 1)*stripGap) / stripCount;
    
     [_stripArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         UIView *stripView = obj;
         stripView.backgroundColor = [UIColor redColor];
         CGFloat height = 100 + arc4random_uniform(250);
         [stripView setFrame:CGRectMake(kMargin + idx*(width + stripGap), self.view.height - 100 - height, width, height)];
         [self.view addSubview:stripView];
         
     }];
}

#pragma mark -- Touch Events

- (void)segmentValueChanged:(UISegmentedControl *)segmentControl
{
//    switch (segmentControl.selectedSegmentIndex) {
//        case 0:
//            
//            break;
//            
//        default:
//            break;
//    }
    
//    [self resetSortView];
//    [_stripArray swap];
    CGFloat originX1 = _stripArray[0].origin.x;
    CGFloat originX2 = _stripArray[50].origin.x;
    [UIView animateWithDuration:0.3 animations:^{
        [_stripArray[0] setOrigin:CGPointMake(originX2, _stripArray[0].origin.y)];
        [_stripArray[50] setOrigin:CGPointMake(originX1, _stripArray[50].origin.y)];
    }];
    
}

- (void)tag
{
    NSLog(@"11111111111");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

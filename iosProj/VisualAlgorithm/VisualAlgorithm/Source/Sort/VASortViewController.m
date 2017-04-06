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
@property (nonatomic, assign) NSInteger selectedSegmentIndex;
@property (nonatomic, copy) NSMutableArray<UIView *> *stripArray;
@property (nonatomic, strong) dispatch_semaphore_t semaPhore;
@property (nonatomic, strong) NSTimer *timer;

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
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Sort"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(sortBtnPress:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self.segmentControl setFrame:CGRectMake(kMargin, 64 + kMargin, self.view.width - 2*kMargin, 30)];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(tag) userInfo:nil repeats:NO];
    
    self.semaPhore = dispatch_semaphore_create(0);
    //dispatch_semaphore_signal(_semaPhore);
    //NSLog(@"111");
    //dispatch_semaphore_wait(_semaPhore, DISPATCH_TIME_FOREVER);
    //sleep(1000);
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
         CGFloat height = 50 + arc4random_uniform(300);
         [stripView setFrame:CGRectMake(kMargin + idx*(width + stripGap), self.view.height - 100 - height, width, height)];
         [self.view addSubview:stripView];
         
     }];
}

#pragma mark -- Touch Events

- (void)segmentValueChanged:(UISegmentedControl *)segmentControl
{
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
            
            break;
            
        default:
            break;
    }
    
    [self resetSortView];
    _selectedSegmentIndex = segmentControl.selectedSegmentIndex;
    
}

- (void)sortBtnPress:(UIBarButtonItem *)sender
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.002 target:self selector:@selector(launchTimerAction) userInfo:nil repeats:YES];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        switch (_selectedSegmentIndex) {
            case 0:
            {
                [_stripArray startBubbleSort:_stripArray callBack:^(NSUInteger stripArrayIdx1, NSUInteger stripArrayIdx2) {
                    [self swapWithIndex1:stripArrayIdx1 index2:stripArrayIdx2];
                }];
            }
                break;
                
            case 1:
                break;
                
            default:
                break;
        }
        
        if (self.timer) {
            [self.timer invalidate]; self.timer = nil;
        }
        
    });

}

- (void)swapWithIndex1:(NSUInteger)idx1 index2:(NSUInteger)idx2
{
    dispatch_semaphore_wait(_semaPhore, DISPATCH_TIME_FOREVER);

    dispatch_async(dispatch_get_main_queue(), ^{
        
        CGFloat originX1 = _stripArray[idx1].origin.x;
        CGFloat originX2 = _stripArray[idx2].origin.x;
//        [UIView animateWithDuration:0.3 animations:^{
            [_stripArray[idx1] setOrigin:CGPointMake(originX2, _stripArray[idx1].origin.y)];
            [_stripArray[idx2] setOrigin:CGPointMake(originX1, _stripArray[idx2].origin.y)];
//        }];
    
    });
}


- (void)launchTimerAction
{
    dispatch_semaphore_signal(_semaPhore);
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

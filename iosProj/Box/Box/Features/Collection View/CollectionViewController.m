//
//  CollectionViewController.m
//  colletcionView
//
//  Created by zhuqi on 15/2/4.
//  Copyright (c) 2015年 zhuqi. All rights reserved.
//

#import "CollectionViewController.h"
#import "MyCollectionViewCell.h"
#import "Header.h"
#import "Footer.h"

@interface CollectionViewController ()

@end

static NSString *kCollectionViewCellIdentifier = @"Cells";
static NSString *kCollectionViewHeaderIdentifier = @"Header";
static NSString *kCollectionViewFooterIdentifier = @"Footer";

@implementation CollectionViewController

const NSTimeInterval kAnimationDuration = 0.2;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    self.collectionView.backgroundColor = [UIColor orangeColor];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinches:)];
    for (UIGestureRecognizer *gesture in self.collectionView.gestureRecognizers) {
        if ([gesture isKindOfClass:[pinchGesture class]]) {
            [gesture requireGestureRecognizerToFail:pinchGesture];
        }
    }
    [self.collectionView addGestureRecognizer:pinchGesture];
}

- (void)handlePinches:(UIPinchGestureRecognizer *)paramSender {
    CGSize DefaultLayoutItemSize = CGSizeMake(80.0f, 120.0f);
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(DefaultLayoutItemSize.width * paramSender.scale, DefaultLayoutItemSize.height * paramSender.scale);
    
    [layout invalidateLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)flowLayOut {
    if (!flowLayOut) {
        flowLayOut = [self flowLayOut];
    }
    
    self = [super initWithCollectionViewLayout:flowLayOut];
    
    if (self != nil) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([MyCollectionViewCell class]) bundle:[NSBundle mainBundle]];
        
        //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCollectionViewCellIdentifier];
        [self.collectionView registerNib:nib
              forCellWithReuseIdentifier:kCollectionViewCellIdentifier];
        
        UINib *headerNib = [UINib nibWithNibName:NSStringFromClass([Header class]) bundle:[NSBundle mainBundle]];
        [self.collectionView registerNib:headerNib
              forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                     withReuseIdentifier:kCollectionViewHeaderIdentifier];
        
        UINib *footerNib = [UINib nibWithNibName:NSStringFromClass([Footer class]) bundle:[NSBundle mainBundle]];
        [self.collectionView registerNib:footerNib
              forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                     withReuseIdentifier:kCollectionViewFooterIdentifier];
    }
    
    return self;
}

- (UICollectionViewFlowLayout *)flowLayOut {
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayOut.minimumLineSpacing = 20.0f;
    flowLayOut.minimumInteritemSpacing = 10.0f;
    flowLayOut.itemSize = CGSizeMake(120.0f, 120.0f);
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayOut.sectionInset = UIEdgeInsetsMake(10.0f, 20.0f, 10.0f, 20.0f);
    flowLayOut.headerReferenceSize = CGSizeMake(300.0f, 50.0f);
    flowLayOut.footerReferenceSize = CGSizeMake(300.0f, 50.0f);
    return flowLayOut;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSArray *)allSectionColors {
    static NSArray *allSectionColors = nil;
    
    if (!allSectionColors) {
        allSectionColors = @[
                             [UIColor redColor],
                             [UIColor greenColor],
                             [UIColor blueColor],
                             ];
    }
    
    return allSectionColors;
}

- (NSArray *)allImages {
    static NSArray *allSelectionImages = nil;
    
    if (!allSelectionImages) {
        allSelectionImages = @[
                               [UIImage imageNamed:@"1"],
                               [UIImage imageNamed:@"2"],
                               [UIImage imageNamed:@"3"]
                               ];
    }
    
    return allSelectionImages;
}

- (UIImage *)radomImage {
    return [self allImages][arc4random_uniform((u_int32_t)[self allImages].count)];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //return [self allSectionColors].count;
    return 3 + arc4random_uniform(4);
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //return 20 + arc4random_uniform(21);
    return 10 + arc4random_uniform(6);
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell
//    cell.backgroundColor = [self allSectionColors][indexPath.section];
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.imageViewBackgroundImage.image = [self radomImage];
    cell.imageViewBackgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        selectedCell.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:kAnimationDuration animations:^{
            selectedCell.alpha = 1.0f;
        }];
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        selectedCell.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        selectedCell.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    }];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = kCollectionViewHeaderIdentifier;
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        reuseIdentifier = kCollectionViewFooterIdentifier;
    }
    
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                        withReuseIdentifier:reuseIdentifier
                                                                               forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        Header *header = (Header *)view;
        header.label.text = [NSString stringWithFormat:@"Section Header %d",indexPath.section + 1];
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        Footer *footer = (Footer *)view;
        [footer.button setTitle:[NSString stringWithFormat:@"Section Footer %d",indexPath.section + 1]
                       forState:UIControlStateNormal];
    }
    
    
    return view;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if (action == @selector(copy:)) {
        return YES;
    }
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if (action == @selector(copy:)) {
        MyCollectionViewCell *cell = (MyCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        
        [[UIPasteboard generalPasteboard] setImage:cell.imageViewBackgroundImage.image];
    }
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end

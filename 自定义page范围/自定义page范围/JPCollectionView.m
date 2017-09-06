//
//  JPCollectionView.m
//  xxx
//
//  Created by xxx on 2017/5/4.
//  Copyright © 2017年 xxx. All rights reserved.
//

#import "JPCollectionView.h"
#import "JPFlowLayout.h"
#import "JPCell.h"
#define MatchWidth(X) X * [UIScreen mainScreen].bounds.size.width/414.0

#define MatchHeight(Y) Y * [UIScreen mainScreen].bounds.size.height/736.0
@interface JPCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak) UIScrollView *placeholderSV;
@end

@implementation JPCollectionView

static NSString *const JPCellID = @"JPCell";
static NSInteger const MaxItemCount = 19;

+ (JPCollectionView *)collectionViewWithFrame:(CGRect)frame {
    JPFlowLayout *flowLayout = [[JPFlowLayout alloc] init];
    flowLayout.itemSize =CGSizeMake(MatchWidth(80), MatchWidth(80)*(122/80.0));

    JPCollectionView *collectionView = [[self alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    return collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        self.backgroundColor = [UIColor yellowColor];
        
        [self registerClass:[JPCell class] forCellWithReuseIdentifier:JPCellID];
        self.delegate = self;
        self.dataSource = self;
        self.scrollEnabled = NO;
                
        CGFloat width = MatchWidth(90)*4;
        UIScrollView *placeholderSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
        placeholderSV.pagingEnabled = YES;
        placeholderSV.delegate = self;
        placeholderSV.showsHorizontalScrollIndicator = YES;
        [placeholderSV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
        [self addSubview:placeholderSV];
        self.placeholderSV = placeholderSV;
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.placeholderSV) {
        self.contentOffset = scrollView.contentOffset;
        NSLog(@"%f",scrollView.contentOffset.x);
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return self.placeholderSV;
}
- (void)tap:(UITapGestureRecognizer *)tapGR {
//    CGPoint point = [tapGR locationInView:self];
//    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
//    if (indexPath) {
//        [self collectionView:self didSelectItemAtIndexPath:[self indexPathForItemAtPoint:point]];
//    }
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.placeholderSV.contentSize = CGSizeMake((MatchWidth(80.0)+MatchWidth(10))*MaxItemCount, 0);
    return MaxItemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JPCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JPCellID forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%zd", indexPath.item];
    return cell;
}

#pragma mark - UICollectionViewDataSource

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    [self.placeholderSV setContentOffset:CGPointMake(indexPath.item * self.placeholderSV.jp_width, 0) animated:YES];
}



@end

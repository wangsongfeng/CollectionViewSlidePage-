//
//  ViewController.m
//  自定义page范围
//
//  Created by xxx on 2017/5/4.
//  Copyright © 2017年 xxx. All rights reserved.
//

#import "ViewController.h"
#import "JPCollectionView.h"
#define MatchWidth(X) X * [UIScreen mainScreen].bounds.size.width/414.0

#define MatchHeight(Y) Y * [UIScreen mainScreen].bounds.size.height/736.0
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    CGFloat height = width * (250.0 / 375.0);
    CGFloat height=MatchWidth(80)*(122/80.0)+MatchHeight(30)+MatchHeight(14);

    CGFloat y = ([UIScreen mainScreen].bounds.size.height - height) * 0.5;

    JPCollectionView *collectionView = [JPCollectionView collectionViewWithFrame:CGRectMake(0, y, width, height)];
    [self.view addSubview:collectionView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

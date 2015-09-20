//
//  BaseCollectionView.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/25.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "BaseCollectionView.h"
#import "Basedefine.h"
#import "UIViewExt.h"

@implementation BaseCollectionView

- (void)setMovieModalArray:(NSArray *)movieModalArray
{
    _movieModalArray = movieModalArray;
    
    [self reloadData];
}

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource =self;
        self.delegate =self;
        //不注册单元格，子类注册；
        
        
            }
    return self;
}

#pragma mark - delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.movieModalArray.count;
}

//不注册
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.itemWidth, self.height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, (kWidth-self.itemWidth)/2, 0, (kWidth - self.itemWidth)/2);
    
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    //targetContentOffset  目标偏移量 给你的值
    CGFloat itemWith = self.itemWidth;
    CGFloat x = targetContentOffset ->x;
    NSInteger index = x/itemWith;
    if (index < 0) {
        index = 0;
    }else if(index >= _movieModalArray.count){
        index = _movieModalArray.count -1;
    }
    targetContentOffset->x = itemWith * index;
    
    self.currentIndex = index;
    
}

@end
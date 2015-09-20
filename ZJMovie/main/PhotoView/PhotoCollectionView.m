//
//  PhotoCollectionView.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/23.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoScrollView.h"

@implementation PhotoCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {

    self.delegate = self;
    self.dataSource = self;
    self.pagingEnabled = YES;
    //注册单元格
    [self registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
    }
    return self;
}

- (void)setImageUrlArray:(NSArray *)imageUrlArray
{
    _imageUrlArray = imageUrlArray;
    [self reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageUrlArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageUrlStr = _imageUrlArray[indexPath.row];
    return cell;
}

//当cell消失的时候 执行的方法
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    //01 拿到cell
    PhotoCollectionViewCell *photoCell = (PhotoCollectionViewCell*)cell;
    
    //02 cell  --> scrollView 放大倍数设置为1
    
    PhotoScrollView*scrollView = (PhotoScrollView *)[photoCell.contentView viewWithTag:100];
    
    scrollView.zoomScale = 1.0;
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

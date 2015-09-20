//
//  PosterCollectionView.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/24.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCollectionViewCell.h"
#import "UIViewExt.h"
#import "Basedefine.h"
#import "MovieModal.h"

@implementation PosterCollectionView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource =self;
        self.delegate =self;
        
        [self registerClass:[PosterCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}


#pragma mark - delegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PosterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    MovieModal *modal = self.movieModalArray[indexPath.row];
    cell.modal =modal;
    return cell;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //点击当前页翻转 ，点击旁边的图不翻转
    if (indexPath.row == self.currentIndex) {
        
    PosterCollectionViewCell *cell = (PosterCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [cell  flipCell];
    }else{
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentIndex = indexPath.row;
    }
    
}



@end

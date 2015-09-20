//
//  HeaderCollectionView.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/25.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "HeaderCollectionView.h"
#import "HeaderCollectionViewCell.h"
#import "PosterCollectionViewCell.h"
#import "PosterCollectionView.h"
#import "UIViewExt.h"
#import "Basedefine.h"
#import "MovieModal.h"
@implementation HeaderCollectionView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource =self;
        self.delegate =self;
        
        [self registerClass:[HeaderCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    }
    return self;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    MovieModal *modal = self.movieModalArray[indexPath.row];
    cell.imageUrlStr = [modal.images objectForKey:@"small"];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.itemWidth, self.height);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //点击当前页翻转 ，点击旁边的图不翻转
    if (indexPath.row != self.currentIndex) {
        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentIndex = indexPath.row;
        

        
    }
    
}



@end

//
//  PhotoCollectionView.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/23.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhotoCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic, retain)  NSArray *imageUrlArray;
@end

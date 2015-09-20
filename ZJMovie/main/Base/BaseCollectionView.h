//
//  BaseCollectionView.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/25.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic, retain)  NSArray *movieModalArray;//传递数组
@property (nonatomic, assign)  NSInteger currentIndex;
@property (nonatomic, assign)  CGFloat itemWidth;
@end

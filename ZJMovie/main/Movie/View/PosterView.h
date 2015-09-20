//
//  PosterView.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/24.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterCollectionView.h"
#import "HeaderCollectionView.h"

@interface PosterView : UIView
{
    UIView *_headerView;
    HeaderCollectionView *_headerCollectionView;//小海报视图
    PosterCollectionView *_posterCollectionView;//大海报视图
    UILabel *_bottomTitleLable;
    //UIView * _coverView;  因为UIView 无法添加addTarget
    UIControl * _coverView;//用control是为了可以点击之后 头视图也能收上去
}
@property (nonatomic, retain)  NSArray *movieModalArray;
@end

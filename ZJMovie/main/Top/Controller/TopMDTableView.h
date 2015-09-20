//
//  TopMDTableView.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/29.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModal.h"
#import "TopModal.h"
#import "HeadView.h"
#import "CommentHeaderCollectionView.h"

@interface TopMDTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

{
    BOOL isHit[30];
}

@property (nonatomic, copy)  NSMutableArray *commentArr;
@property (nonatomic, retain)  MovieDetailModal *detailModel;


@property (nonatomic, retain)  HeadView *headView;

@property (nonatomic)  CommentHeaderCollectionView *headerCollectonView;

@end

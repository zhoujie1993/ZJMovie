//
//  CommentHeaderCollectionView.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModal.h"
#import <MediaPlayer/MediaPlayer.h>
@interface CommentHeaderCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic) MovieDetailModal *headerModal;

@end

//
//  PosterCollectionViewCell.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/24.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"
#import "PosterDetailView.h"

@interface PosterCollectionViewCell : UICollectionViewCell
{
    PosterDetailView *_detialView;
    UIImageView *_imageView;
}

@property (nonatomic, retain) MovieModal *modal;
@property (nonatomic, assign)  BOOL *isBack;

- (void)flipCell;
@end

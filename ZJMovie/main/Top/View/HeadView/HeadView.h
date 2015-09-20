//
//  HeadView.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/28.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModal.h"
#import "CommentHeaderCollectionView.h"

@interface HeadView : UIView<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLable;
@property (strong, nonatomic) IBOutlet UILabel *directorsLable;
@property (strong, nonatomic) IBOutlet UILabel *actorsLable;
@property (strong, nonatomic) IBOutlet UILabel *typeLable;
@property (strong, nonatomic) IBOutlet UILabel *timeLable;

@property (nonatomic, strong)  MovieDetailModal *modal;

- (IBAction)playAction:(id)sender;

@end

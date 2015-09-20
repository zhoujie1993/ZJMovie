//
//  TopCollectionViewCell.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/22.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
#import "MovieModal.h"

@interface TopCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet StarView *starView;
@property (weak, nonatomic) IBOutlet UILabel *averageLable;

@property (nonatomic,assign) MovieModal *modal;
@end

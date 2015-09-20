//
//  MovieCell.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/20.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
#import "MovieModal.h"

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *yearLable;
@property (weak, nonatomic) IBOutlet UILabel *averageLable;

@property (weak, nonatomic) IBOutlet StarView *starView;

@property (nonatomic, copy)  MovieModal *modal;
@end

//
//  PosterDetailView.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/25.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"
#import "StarView.h"

@interface PosterDetailView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *englishTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *yearLable;
@property (weak, nonatomic) IBOutlet UILabel *averageLable;
@property (weak, nonatomic) IBOutlet StarView *starView;
@property (nonatomic,strong) MovieModal *modal;
@end

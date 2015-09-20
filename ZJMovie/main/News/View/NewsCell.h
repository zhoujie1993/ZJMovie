//
//  NewsCell.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/21.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewModal.h"
#import "UIImageView+WebCache.h"


@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UIImageView *typeImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *summryLable;
@property (nonatomic, retain) NewModal *news;

@end

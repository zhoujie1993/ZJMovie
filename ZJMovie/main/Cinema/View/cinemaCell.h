//
//  cinemaCell.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/22.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cinemaModal.h"

@interface cinemaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *addressLable;
@property (weak, nonatomic) IBOutlet UILabel *gradeLable;
@property (weak, nonatomic) IBOutlet UILabel *distanceLable;
@property (weak, nonatomic) IBOutlet UILabel *lowPriceLable;
@property (weak, nonatomic) IBOutlet UIImageView *seatImageView;
@property (weak, nonatomic) IBOutlet UIImageView *couponImageView;

@property (nonatomic, retain)  cinemaModal *modal;
@end

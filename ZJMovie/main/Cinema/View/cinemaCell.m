//
//  cinemaCell.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/22.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "cinemaCell.h"
#import "cinemaModal.h"

@implementation cinemaCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
    
}

- (void)setModal:(cinemaModal *)modal{
    _modal = modal;
    [self setNeedsLayout];
    
}
//@property (weak, nonatomic) IBOutlet UILabel *titleLable;
//@property (weak, nonatomic) IBOutlet UILabel *addressLable;
//@property (weak, nonatomic) IBOutlet UILabel *gradeLable;
//@property (weak, nonatomic) IBOutlet UILabel *distanceLable;
//@property (weak, nonatomic) IBOutlet UILabel *lowPriceLable;
//@property (weak, nonatomic) IBOutlet UIImageView *seatImageView;
//@property (weak, nonatomic) IBOutlet UIImageView *couponImageView;
- (void)layoutSubviews{
    [super layoutSubviews];
    // _newsImage = _news.newsImage;
    
    
    _titleLable.text = _modal.name;
    _addressLable.text = _modal.address;
    _gradeLable.text = _modal.grade;
    _distanceLable.text = @"10km";
    _lowPriceLable.text = _modal.lowPrice;



    
    NSString *typeStr = nil;
    if ([_modal.isSeatSupport isEqualToString:@"0"]) {
        typeStr = nil;
        
    }else{
        typeStr = @"cinemaSeatMark@2x";
    }
    
    NSString *typeStr1 = nil;
    if ([_modal.isCouponSupport isEqualToString:@"0"]) {
        typeStr1 = nil;
        
    }else{
        typeStr1 = @"cinemaCouponMark@2x";
    }
    
    
    _seatImageView.image = [UIImage imageNamed:typeStr];
    _couponImageView.image = [UIImage imageNamed:typeStr1];
    
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end

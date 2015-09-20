//
//  MovieCell.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/20.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+WebCache.h"

@implementation MovieCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
    
}
- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setModal:(MovieModal *)modal{
    _modal = modal;
    _starView.average = _modal.average;
    [self setNeedsLayout];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
//    //该方法要取消自动布局
//    CGFloat width = _averageLable.frame.size.width;
//    CGFloat height = _averageLable.frame.size.height;
//    CGFloat y = CGRectGetMinY(_averageLable.frame);
    
    
//    UIImage *image1 = [UIImage imageNamed:@"yellow"];
//    UIImage *image2 = [UIImage imageNamed:@"gray"];
//    
//    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 35, image1.size.width * _modal.average /2, image1.size.height)];
//    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(100, 35, image2.size.width * 5, image1.size.height)];
//    
//    view1.backgroundColor = [UIColor colorWithPatternImage:image1];
//    view2.backgroundColor = [UIColor colorWithPatternImage:image2];
//    [self addSubview:view2];
//    [self addSubview:view1];
    
    
    
    _titleLable.text = _modal.title;
    _yearLable.text = [NSString stringWithFormat:@"年份：%@",_modal.year];
    _averageLable.text = [NSString stringWithFormat:@"%.1f",_modal.average];
    
    
    
    
    
    //网上的图
    NSString *imageStr = [_modal.images objectForKey:@"small"];
    
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end

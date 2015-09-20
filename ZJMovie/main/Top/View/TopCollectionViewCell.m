//
//  TopCollectionViewCell.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/22.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "TopCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation TopCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModal:(MovieModal *)modal{
    _modal =modal;
    _starView.average = _modal.average;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSString *str = [_modal.images objectForKey:@"small"];
    [_imageView1 sd_setImageWithURL:[NSURL URLWithString:str]];
    
    
    _titleLable.text = _modal.title;
    _titleLable.textColor = [UIColor whiteColor];
    _averageLable.text = [NSString stringWithFormat:@"%.1f",_modal.average];
}

@end

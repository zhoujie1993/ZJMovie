//
//  PosterDetailView.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/25.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "PosterDetailView.h"
#import "UIImageView+WebCache.h"

@implementation PosterDetailView

- (void)setModal:(MovieModal *)modal
{
    _modal = modal;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    NSString *imageStr = [_modal.images objectForKey:@"large"];
    [_movieImageView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    
    _titleLable.text = _modal.title;
    _yearLable.text = [NSString stringWithFormat:@"年份:%@",_modal.year];
    _englishTitleLable.text = [NSString stringWithFormat:@"英文名:%@",_modal.original_title];
    _averageLable.text =[NSString stringWithFormat:@"%.1f",_modal.average];
    _starView.average = _modal.average;
    
}
@end

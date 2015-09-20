//
//  NewsCell.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/21.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "NewsCell.h"
#import "NewModal.h"

@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
    
}

- (void)setNews:(NewModal *)news{
    _news = news;
    [self setNeedsLayout];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
   // _newsImage = _news.newsImage;
    
    _titleLable.text = _news.title;
    _summryLable.text = _news.summary;
    
    NSString *typeStr = nil;
    if (_news.type == 0) {
        typeStr = nil;
        
    }else if(_news.type == 1){
        typeStr = @"scspxw";
    }else if(_news.type == 2)
    {
        typeStr = @"sctpxw";
    }
        
    _typeImage.image = [UIImage imageNamed:typeStr];
    [_newsImage sd_setImageWithURL:[NSURL URLWithString:_news.image]];
    
    
}
@end

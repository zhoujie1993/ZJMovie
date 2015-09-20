//
//  ImageCell.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/22.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "ImageCell.h"
#import "UIImageView+WebCache.h"

@implementation ImageCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubView];
    }
    return self;
}

- (void)_createSubView{
    _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    //角上圆弧的半径
    _imageView.layer.cornerRadius = 20;
    //外框边宽度
    _imageView.layer.borderWidth = 1;
    //@property CGColorRef borderColor;注：这个是CGColor
    _imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    //框框外面多出的部分是否裁掉
    _imageView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_imageView];
    
}

- (void)setModal:(ImageModal *)modal
{
    _modal = modal;
    [self setNeedsLayout];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_modal.image]];
}
@end

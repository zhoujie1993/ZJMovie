//
//  PhotoCollectionViewCell.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/23.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[PhotoScrollView alloc]initWithFrame:self.bounds];
        _scrollView.tag = 100;
        [self.contentView  addSubview:_scrollView];
        //_scrollView.imageUrlStr = self.imageUrlStr;
    }
    return self;
}

- (void)setImageUrlStr:(NSString *)imageUrlStr
{
    _imageUrlStr = imageUrlStr;
    _scrollView.imageUrlStr = imageUrlStr;
    [self setNeedsLayout];
}

@end

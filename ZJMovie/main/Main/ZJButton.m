//
//  ZJButton.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "ZJButton.h"


@implementation ZJButton

- (id)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName  withTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        //设置等比例填充
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = [UIImage imageNamed:imageName];
        [self addSubview:_imageView];
        
        
        _label = [[UILabel alloc]initWithFrame:CGRectZero];
        _label.text = title;
        _label.font = [UIFont systemFontOfSize:11];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor whiteColor];
        [self addSubview:_label];
    }
    return self;
}

- (void)layoutSubviews
{
    _imageView.frame = CGRectMake((self.frame.size.width - 20)/2, 5, 20, 20);
    _label.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame), CGRectGetWidth(self.frame), 20);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

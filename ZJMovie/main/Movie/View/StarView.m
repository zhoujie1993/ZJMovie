//
//  StarView.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/21.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "StarView.h"

@implementation StarView

//alloc 手动创建
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubviews];
    }
    return self;
}


//如果是从XIB文件直接创建出来的对象，则调用awakeFromNib
- (void)awakeFromNib
{
    [self _createSubviews];
}

- (void)_createSubviews{
    UIImage *yellowImage = [UIImage imageNamed:@"yellow"];
    UIImage *grayImage = [UIImage imageNamed:@"gray"];
    
    _grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, grayImage.size.width * 5, grayImage.size.height)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImage];
    
    _yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, yellowImage.size.width * 5, yellowImage.size.height)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImage];
    
    
    [self addSubview:_grayView];
    [self addSubview:_yellowView];
    
    //放大倍数
    float scale = self.frame.size.height/grayImage.size.height;
    
    _grayView.transform = CGAffineTransformMakeScale(scale, scale);
    _yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    
    
    //放大以后需要坐标调整
    CGRect frame = _grayView.frame;
    frame.origin = CGPointZero;
    _grayView.frame = frame;
    _yellowView.frame =frame;
    
    
    
}

- (void)setAverage:(float)average
{
    _average =average;
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    float width = _average/10.0 * _grayView.frame.size.width;
    
    CGRect frame = _grayView.frame;
    frame.size.width =width;
    _yellowView.frame =frame;
    
}

-(float)width
{
    return self.frame.size.width;
}
- (void)setWidth:(float)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

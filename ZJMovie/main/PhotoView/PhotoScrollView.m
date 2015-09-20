//
//  PhotoScrollView.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/23.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "PhotoScrollView.h"
#import "UIImageView+WebCache.h"

@implementation PhotoScrollView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc]initWithFrame:frame];//这是错的
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        //_imageView.backgroundColor = [UIColor yellowColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        
        self.delegate =self;
        self.maximumZoomScale = 3;
        self.minimumZoomScale = 1;
    
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap)];
        
        doubleTap.numberOfTapsRequired = 2;
        
        doubleTap.numberOfTouchesRequired = 1;
        
        
        [self addGestureRecognizer:doubleTap];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap) ];
        
        [self addGestureRecognizer:singleTap];
        
        [singleTap requireGestureRecognizerToFail:doubleTap];
        
    }
    return self;
}

- (void)singleTap
{
    NSLog(@"singTap");
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"HideNavigationBarNotification" object:nil];
}

- (void)doubleTap
{
    NSLog(@"doubleTap");
}
- (void)setImageUrlStr:(NSString *)imageUrlStr
{
    _imageUrlStr =imageUrlStr;
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:self.imageUrlStr]];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

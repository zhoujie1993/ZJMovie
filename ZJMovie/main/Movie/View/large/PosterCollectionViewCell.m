//
//  PosterCollectionViewCell.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/24.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "PosterCollectionViewCell.h"
#import "Basedefine.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"

@implementation PosterCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _createSubViews];
    }
    return self;
}



-(void)setModal:(MovieModal *)modal
{
    _modal = modal;
    _detialView.modal = modal;
    [self setNeedsLayout];
}

- (void)_createSubViews
{
    CGFloat imageWidth =self.width*0.9;
    CGFloat imageHeight =self.height*0.9;
    
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *views = [bundle loadNibNamed:@"PosterDetailView" owner:self options:nil];
    _detialView = [views lastObject];
    _detialView.backgroundColor = [UIColor grayColor];
    _detialView.frame =CGRectMake((self.width -imageWidth)/2, (self.height-imageHeight)/2, imageWidth, imageHeight);
    [self.contentView addSubview:_detialView];
    
    
   
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.width -imageWidth)/2, (self.height-imageHeight)/2, imageWidth, imageHeight)];
    
    [self.contentView addSubview:_imageView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (_isBack) {
        _detialView.hidden = NO;
        _imageView.hidden = YES;
    }else{
        _detialView.hidden = YES;
        _imageView.hidden = NO;
    }
    
    
    NSString *str =[_modal.images objectForKey:@"large"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
}

-(void)flipCell{
    [self _flipView:self isLeft:YES];
    _imageView.hidden = !_imageView.hidden;
    _detialView.hidden = !_detialView.hidden;
}

- (void)_flipView:(UIView*)view isLeft:(BOOL)isLeft{
    UIViewAnimationOptions option = isLeft?UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionWithView:view duration:.3 options:option animations:nil completion:nil];
    
}
@end

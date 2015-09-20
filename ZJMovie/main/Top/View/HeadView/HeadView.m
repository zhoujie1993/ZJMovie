//
//  HeadView.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/28.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//


#import "HeadView.h"
#import "UIImageView+WebCache.h"
#import <MediaPlayer/MediaPlayer.h> //播放视频

@implementation HeadView



-(void)awakeFromNib{
    [self setNeedsLayout];
}


- (void)setModal:(MovieDetailModal *)modal{
    _modal =modal;

    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    
    [super layoutSubviews];

//    for (NSInteger i =0 ; i <_modal.videos.count; i++) {
//        NSDictionary *dic = _modal.videos[i];
//        NSString *imageName = [dic objectForKey:@"image"];
//        
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(2 + 70 *i, 2, 70, 70)];
//        
//        [imageView setImage:[UIImage imageNamed:imageName]];
//        
//        [_scrollView addSubview:imageView];
//        
//    }
    
  
    _titleLable.text = _modal.titleCn;
    
    _directorsLable.text = [NSString stringWithFormat:@"导演:%@",_modal.directors[0]];
    
    NSMutableString *str = [[NSMutableString alloc]init];
    for (NSInteger i = 0; i < _modal.actors.count; i++) {
        [str appendString:@"、"];
        [str appendString:_modal.actors[i]];
    }

    NSString *str0 = [str substringFromIndex:1];
    _actorsLable.text = [NSString stringWithFormat:@"主演:%@",str0];
    
    
    
    
    //类型
    NSString *type = [_modal.type componentsJoinedByString:@","];
    _typeLable.text = [NSString stringWithFormat:@"类型: %@",type];
    
    
    
    _timeLable.text = _modal.dic;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_modal.image]];


}


- (IBAction)playAction:(id)sender
{
    
    //发送播放电影的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playMovieNotification" object:nil];

}
@end

//
//  CommentHeaderCollectionViewCell.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "CommentHeaderCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CommentHeaderCollectionViewCell

- (void)awakeFromNib {
   
 
    
}


-(void)setImage:(NSString *)image
{
    _image=image;
    
    
    
    [self setNeedsLayout];
    
    
}


-(void)layoutSubviews
{
    
    [_imageView1    sd_setImageWithURL:[NSURL URLWithString:@"http://img3.douban.com/view/photo/icon/public/p1943399384.jpg"]];

    
    
  
    
    
    _imageView1.layer.cornerRadius=10;
    _imageView1.layer.borderWidth=1;
    _imageView1.layer.borderColor=[UIColor whiteColor].CGColor;
    
    _imageView1.layer.masksToBounds=YES;
    
    _imageView1.contentMode = UIViewContentModeScaleToFill;
    

    
}

@end

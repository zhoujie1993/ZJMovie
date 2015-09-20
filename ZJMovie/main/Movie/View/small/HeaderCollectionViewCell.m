//
//  HeaderCollectionViewCell.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/25.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "HeaderCollectionViewCell.h"
#import "Basedefine.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"

@implementation HeaderCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat imageWidth =self.width*0.9;
        CGFloat imageHeight =self.height*0.9;
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.width -imageWidth)/2, (self.height-imageHeight)/2, imageWidth, imageHeight)];
        
        [self.contentView addSubview:_imageView];
    }
    return self;
}

- (void)setImageUrlStr:(NSString *)imageUrlStr
{
    _imageUrlStr = imageUrlStr;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_imageUrlStr]];
    
    
}
@end

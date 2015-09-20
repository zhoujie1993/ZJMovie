//
//  CommentTableViewCell.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/29.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CommentTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellEditingStyleNone;
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(73, 30, 230, 22)];
    lable.tag = 100;
    lable.numberOfLines = 0;
    lable.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:lable];
    
    _imageView1.layer.cornerRadius = 10;
    _imageView1.layer.borderWidth =1;
    _imageView1.layer.borderColor = [UIColor whiteColor].CGColor;
    _imageView1.layer.masksToBounds = YES;
    
    _imageView2.layer.cornerRadius = 10;
    _imageView2.layer.borderWidth =1;
    _imageView2.layer.borderColor = [UIColor whiteColor].CGColor;
    _imageView2.layer.masksToBounds = YES;
    
    

    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

- (void)setModal:(CommentModel *)modal
{
    _modal = modal;
    [self setNeedsLayout];
}
-(void)layoutSubviews{
    NSString *string = _modal.userImage;
    [_imageView1 sd_setImageWithURL:[NSURL URLWithString:string]];
    
    _laber1.text = _modal.nickname;
    
    
    UILabel *lable = (UILabel*)[self viewWithTag:100];
    lable.text = _modal.content;
    
    _laber2.text = _modal.rating;
}
@end

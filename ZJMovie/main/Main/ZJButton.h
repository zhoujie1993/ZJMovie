//
//  ZJButton.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJButton : UIControl{
    UIImageView  *_imageView;
    UILabel *_label;
}

- (id)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName  withTitle:(NSString *)title;
@end

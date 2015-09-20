//
//  CommentTableViewCell.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/29.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface CommentTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *imageView1;

@property (strong, nonatomic) IBOutlet UIImageView *imageView2;

@property (strong, nonatomic) IBOutlet UILabel *laber1;

@property (strong, nonatomic) IBOutlet UILabel *laber2;

@property (nonatomic, retain) CommentModel *modal;
@end

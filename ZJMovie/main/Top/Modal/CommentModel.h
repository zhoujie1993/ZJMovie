//
//  CommentModel.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/28.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject

@property (nonatomic, copy)  NSString *userImage;
@property (nonatomic, copy)  NSString *nickname;
@property (nonatomic, copy)  NSString *rating;
@property (nonatomic, copy)  NSString *content;

@end

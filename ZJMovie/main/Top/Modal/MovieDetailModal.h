//
//  MovieDetailModal.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/28.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetailModal : NSObject

@property (nonatomic, copy)  NSString *image;
@property (nonatomic, copy)  NSString *titleCn;
@property (nonatomic, copy)  NSArray *actors;
@property (nonatomic, copy)  NSArray *directors;
@property (nonatomic, copy)  NSArray *type;
@property (nonatomic, copy)  NSString *dic;
@property (nonatomic) NSArray *images;

@property (nonatomic, copy)  NSArray *videos;

@end

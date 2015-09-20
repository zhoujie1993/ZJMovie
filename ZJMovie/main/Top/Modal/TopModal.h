//
//  MovieModal.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/20.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopModal : NSObject
@property (nonatomic, copy)  NSString *year;
@property (nonatomic, copy)  NSString *title;
@property (nonatomic, retain)  NSDictionary *images;
@property (nonatomic, assign)  float average;
@end

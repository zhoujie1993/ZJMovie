//
//  NewModal.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/21.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewModal : NSObject
@property (nonatomic, copy)  NSString *image;
@property (nonatomic, copy)  NSString *summary;
@property (nonatomic, copy)  NSString *title;
@property (nonatomic, assign)  NSInteger type;
@property (nonatomic, assign)  NSInteger newsId;
@end

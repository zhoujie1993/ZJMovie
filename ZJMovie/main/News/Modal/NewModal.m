//
//  NewModal.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/21.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "NewModal.h"

@implementation NewModal
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.newsId = [value integerValue];
    }
}
@end

//
//  MovieDetailModal.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/28.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "MovieDetailModal.h"

@implementation MovieDetailModal
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"release"]) {
        _dic = [value objectForKey:@"date"];
    
    }

}
@end

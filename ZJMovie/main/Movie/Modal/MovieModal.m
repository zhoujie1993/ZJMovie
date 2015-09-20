//
//  MovieModal.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/20.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "MovieModal.h"

@implementation MovieModal

- (NSString *)description
{
    NSString *str = [NSString stringWithFormat:@"title = %@",_title];
    return str;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"rating"]) {
        _average = [[value objectForKey:@"average"] floatValue];
    }
    
}

@end

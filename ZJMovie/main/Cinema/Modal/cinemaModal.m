//
//  cinemaModal.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/22.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "cinemaModal.h"

@implementation cinemaModal
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.districtId = value;
    }
    

}
@end

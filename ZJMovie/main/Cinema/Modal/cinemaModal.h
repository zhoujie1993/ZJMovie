//
//  cinemaModal.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/22.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cinemaModal : NSObject
@property (nonatomic, copy)  NSString *name;
@property (nonatomic, copy)  NSString *address;
@property (nonatomic, copy)  NSString *grade;
@property (nonatomic, copy)  NSString *distance;
@property (nonatomic, copy)  NSString *lowPrice;
@property (nonatomic, copy)  NSString *isSeatSupport;
@property (nonatomic, copy)  NSString *isCouponSupport;


@property (nonatomic, assign)  NSString *districtId;

@end

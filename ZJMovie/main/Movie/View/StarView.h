//
//  StarView.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/21.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    UIView *_grayView;
    UIView *_yellowView;
}
@property (nonatomic, assign)  float average;
@property (nonatomic, assign)  float  width;
@end

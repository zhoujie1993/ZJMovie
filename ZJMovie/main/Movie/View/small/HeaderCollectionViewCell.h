//
//  HeaderCollectionViewCell.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/25.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderCollectionViewCell : UICollectionViewCell
{
    UIImageView *_imageView;
}
@property (nonatomic, copy)  NSString *imageUrlStr;
@end

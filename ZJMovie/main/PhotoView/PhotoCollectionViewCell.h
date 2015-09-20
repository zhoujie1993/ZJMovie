//
//  PhotoCollectionViewCell.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/23.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoScrollView.h"

@interface PhotoCollectionViewCell : UICollectionViewCell
{
    PhotoScrollView *_scrollView;
    
}
@property (nonatomic, copy)  NSString *imageUrlStr;
@end

//
//  PhotoViewController.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/23.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionView.h"

@interface PhotoViewController : UIViewController
{
    PhotoCollectionView *_collectionView;
    
}
@property (nonatomic, retain)  NSArray *imageUrlArray;

@property (nonatomic, assign) NSInteger currentIndex;//当前点击的图片索引
@end

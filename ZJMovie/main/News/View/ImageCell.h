//
//  ImageCell.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/22.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModal.h"

@interface ImageCell : UICollectionViewCell
{
    UIImageView *_imageView;
}
@property (nonatomic, copy)  ImageModal *modal;

@end

//
//  TopViewController.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_movieModalArray;
    UICollectionView *_collectionView;
}
@end

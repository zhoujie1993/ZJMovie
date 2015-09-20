//
//  NewImageListViewController.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/22.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "BaseViewController.h"


@interface NewImageListViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    NSMutableArray *_imageModalArray;
    
}
@end

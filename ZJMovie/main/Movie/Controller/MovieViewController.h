//
//  MovieViewController.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PosterView.h"

@interface MovieViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_movieTableView;
    PosterView *_posterView;
    NSMutableArray *_movieModalArray;
}
@end

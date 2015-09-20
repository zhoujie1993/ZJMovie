//
//  CinemaViewController.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CinemaViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_distModalArray;
    NSMutableArray *_cinemaModalArray;
    BOOL flags[200];
}
@end

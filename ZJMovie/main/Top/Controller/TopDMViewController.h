//
//  TopDMViewController.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/29.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopMDTableView.h"

@interface TopDMViewController : UIViewController
{
    TopMDTableView  * _tableView;
    
    NSMutableArray *_commentArr;
    MovieDetailModal *_detailModel;
}
@end

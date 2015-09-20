//
//  TopDMViewController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/29.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "TopDMViewController.h"
#import "DataService.h"
#import "MovieDetailModal.h"
#import "CommentModel.h"
#import "Basedefine.h"
#import "UIViewExt.h"
#import <MediaPlayer/MediaPlayer.h>

@interface TopDMViewController ()

@end

@implementation TopDMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self _loadData];
    [self _createTableView];
    
    //接受播放电影的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(palyMovie) name:@"playMovieNotification" object:nil];
    // Do any additional setup after loading the view.
}

- (void)palyMovie{
    
    // MPMoviePlayerViewController:视频播放控制器,需要导入<MediaPlayer/MediaPlayer.h>框架
    MPMoviePlayerViewController *ctrl = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/06/21/mp4/120621104820876931.mp4"]];
    
    //将视频播放器弹出
    //[self presentViewController:ctrl animated:YES completion:NULL];
    
    [self presentMoviePlayerViewControllerAnimated:ctrl];
    
}

#pragma mark - loadData
- (void)_loadData
{
    NSDictionary *dic = [DataService loadData:@"movie_detail.json"];
    _detailModel = [[MovieDetailModal alloc]init];
    [_detailModel setValuesForKeysWithDictionary:dic];
    
    
    NSDictionary *dic1 = [DataService loadData:@"movie_comment.json"];
    NSArray *list = [dic1 objectForKey:@"list"];
    
    _commentArr = [NSMutableArray array];
    for (NSDictionary *commentDic in list) {
        CommentModel *comment = [[CommentModel alloc]init];
        
        [comment setValuesForKeysWithDictionary:commentDic];
        
        [_commentArr addObject:comment];
    }
}



- (void)_createTableView
{
    _tableView = [[TopMDTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) ];
    
    [self.view addSubview:_tableView];

    
//
//    _tableView.headerCollectonView.delegate=self;
//    _tableView.headerCollectonView.dataSource=self;
    
    
    //[self.view addSubview:_tableView];
    
    
    
    
    
    _tableView.detailModel=_detailModel;
    _tableView.commentArr=_commentArr;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  TopViewController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//
// readyMovie
//"id" : 157836,
//"title" : "摩尔庄园2海妖宝藏",
//"image" : "http://img31.mtime.cn/mt/2012/06/28/131128.94272291.jpg",
//"releaseDate" : "7月5日上映",
//"type" : "动画/动作/奇幻/冒险",
//"director" : "刘可欣",
//"wantedCount" : 258


#import "TopViewController.h"
#import "DataService.h"
#import "Basedefine.h"
#import "MovieModal.h"
#import "TopCollectionViewCell.h"
#import "TopDMViewController.h"



static NSString *cellId = @"TopCollectionViewCell";

@interface TopViewController ()

@end

@implementation TopViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
        titleLabel.text = @"Top250";
        titleLabel.font = [UIFont boldSystemFontOfSize:24];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
         self.navigationItem.titleView =titleLabel;
    }
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initData];
    [self _createCollectionView];
    [self _loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CreateSubviews
- (void)_createCollectionView{
    self.navigationController.navigationBar.translucent = YES;
    
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((kWidth -40)/3, (kWidth -40)/3 * 1.5);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate =self;
    _collectionView.dataSource=self;
    
    UINib *nib = [UINib nibWithNibName:@"TopCollectionViewCell" bundle:nil];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"TopCollectionViewCell"];
    
    [self.view addSubview:_collectionView];
}

- (void)_initData{
    _movieModalArray = [[NSMutableArray alloc]init];
}
- (void)_loadData{
    
    
    NSMutableDictionary *params= [[NSMutableDictionary  alloc]init];
    NSMutableDictionary *data=[[NSMutableDictionary alloc]init];
    [DataService requestAFUrl:@"top250" httpMethod:@"GET" params:params datas:data block:^(id result) {
        NSDictionary *dic=result;
        NSArray *subjects = dic[@"subjects"];
        for (NSDictionary *dic in subjects)
        {
            MovieModal *modal = [[MovieModal alloc]init];
            [modal setValuesForKeysWithDictionary:dic];
            [_movieModalArray addObject:modal];
        }
        [_collectionView reloadData];
    }];
}

#pragma mark - collectionView delagate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _movieModalArray.count;
}
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    cell.modal = _movieModalArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopDMViewController *vc = [[TopDMViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
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

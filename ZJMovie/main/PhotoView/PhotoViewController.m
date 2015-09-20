//
//  PhotoViewController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/23.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "PhotoViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight  [UIScreen mainScreen].bounds.size.height

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createNavigation];
    [self _createCollectionView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideNav) name:@"HideNavigationBarNotification" object:nil];
    // Do any additional setup after loading the view.
}

- (void)hideNav
{
    BOOL isHidden = self.navigationController.navigationBar.isHidden;
    
    [self.navigationController setNavigationBarHidden:!isHidden animated:YES];
}

-(void)_createCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize =self.view.bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //以下事情不要让vc去做 只需要把数据数组给他view让它自己去实现
//    _collectionView.dataSource = self;
//    _collectionView.delegate =self;
    
    layout.minimumLineSpacing =30;
    //layout.minimumInteritemSpacing = 30;
    
    _collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, kWidth +30, kHeight) collectionViewLayout:layout];
    //_collectionView.imageUrlArray = self.imageUrlArray;
    
    [self.view addSubview:_collectionView];
    
     _collectionView.imageUrlArray = _imageUrlArray;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.currentIndex inSection:0];
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

- (void)setImageUrlArray:(NSArray *)imageUrlArray
{
    _imageUrlArray = imageUrlArray;
    _collectionView.imageUrlArray = _imageUrlArray;
    
}
- (void)_createNavigation{
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];

    




}
- (void)cancelAction{
    [self dismissViewControllerAnimated:YES completion:nil];
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

//
//  NewImageListViewController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/22.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "NewImageListViewController.h"
#import "Basedefine.h"
#import "DataService.h"
#import "ImageModal.h"
#import "ImageCell.h"
#import "BaseNavController.h"
#import "PhotoViewController.h"

static NSString *imageCellId = @"imageCellId";

@interface NewImageListViewController ()

@end

@implementation NewImageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createCollectionView];
    [self _loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



#pragma mark - Create Subviews
-(void)_createCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((kWidth - 50)/4, (kWidth - 50)/4);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate =self;
    _collectionView.dataSource =self;
    
    [_collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:imageCellId];
    
    [self.view addSubview:_collectionView];
}

#pragma mark - LoadData
-(void)_loadData
{
    _imageModalArray = [[NSMutableArray alloc]init];
    
    NSArray *jsonArray = [DataService loadData:@"image_list.json"];
    
    for (NSDictionary *dic in jsonArray) {
        ImageModal *modal = [[ImageModal alloc]init];
        [modal setValuesForKeysWithDictionary:dic];
        [_imageModalArray addObject:modal];
    }

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  _imageModalArray.count;
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:imageCellId forIndexPath:indexPath];
    cell.modal = _imageModalArray[indexPath.row];
    return cell;
    
}

//功能抽离 代码不要耦合
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoViewController *vc = [[PhotoViewController alloc]init];
    vc.currentIndex = indexPath.row;
    
    //抽离URL
    NSMutableArray *imageUrlArray = [[NSMutableArray alloc]init];
    for (int i =0;i<_imageModalArray.count;i++)
    {
        ImageModal *modal = _imageModalArray[i];
        NSString *urlStr = modal.image;
        [imageUrlArray addObject:urlStr];
    }
    
    //.view  和.imageUrlArray 是有先后顺序的要注意   不确定
    vc.imageUrlArray = imageUrlArray;
    vc.view.backgroundColor = [UIColor clearColor];
    
    
    BaseNavController *nav = [[BaseNavController alloc]initWithRootViewController:vc];
    //在这调整才有用，要是去PhotoViewController.m已经没用了
    nav.navigationBar.translucent = YES;
    
    [self presentViewController:nav animated:YES completion:nil];
    
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

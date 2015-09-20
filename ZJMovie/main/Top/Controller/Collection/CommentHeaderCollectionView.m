//
//  CommentHeaderCollectionView.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "CommentHeaderCollectionView.h"
#import "CommentHeaderCollectionViewCell.h"
#import "MovieDetailModal.h"

@implementation CommentHeaderCollectionView


-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    
    
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.dataSource =self;
        self.delegate =self;

        //因为要用播放器  需要 controller  所以代理给了 CommentViewController
        
        self.layer.cornerRadius=10;
        self.layer.borderWidth=1;
        self.layer.borderColor=[UIColor whiteColor].CGColor;
        self.layer.masksToBounds=YES;
        
        
        UINib *nib1=[UINib nibWithNibName:@"CommentHeaderCollectionViewCell" bundle:[NSBundle mainBundle]];
       
        [self registerNib:nib1 forCellWithReuseIdentifier:@"cell"];
        
        
    
        
    }
    return self;
    
    
    
}


-(void)setHeaderModal:(MovieDetailModal *)headerModal
{
    
    _headerModal=headerModal;
    [self reloadData];
  
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_headerModal.images count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommentHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.image=   _headerModal.images[indexPath.row] ;
  
    
    return cell;
    

}
@end

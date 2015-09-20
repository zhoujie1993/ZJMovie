//
//  TopMDTableView.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/29.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "TopMDTableView.h"
#import "CommentTableViewCell.h"
#import "UIViewExt.h"
#import "Basedefine.h"
#import "CommentHeaderCollectionView.h"

@implementation TopMDTableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        self.separatorStyle= UITableViewCellSeparatorStyleNone;

        
        UINib *nib=[UINib nibWithNibName:@"CommentTableViewCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellReuseIdentifier:@"cell"];
    }
    return self;
}
-(void)createHeader
{
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *views = [bundle loadNibNamed:@"HeadView" owner:self options:nil];
    _headView = [views lastObject];
    
    _headView.modal = _detailModel;
    
    _headView.frame = CGRectMake(0, 0, 375, 250);
    self.tableHeaderView =_headView;
    
    
    
    
    //组头里面有个collectionView
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize=CGSizeMake(kWidth/4, 90);
    layout.minimumLineSpacing=0;
    layout.minimumInteritemSpacing=0;
    layout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    
    _headerCollectonView=[[CommentHeaderCollectionView alloc]initWithFrame:CGRectMake(5, 160, kWidth-10, 90)collectionViewLayout:layout];
    
    _headerCollectonView.headerModal=_detailModel;
    _headerCollectonView.backgroundColor = [UIColor blueColor];
//    _headerCollectonView.delegate=self;
//    _headerCollectonView.dataSource=self;

    
    [self.tableHeaderView addSubview:_headerCollectonView];
    
    
    
}
- (void)setDetailModel:(MovieDetailModal *)detailModel
{
    _detailModel = detailModel;
    
    [self createHeader];
    [self setNeedsLayout];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return _commentArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor= [UIColor whiteColor];
    cell.modal=_commentArr[indexPath.row];
    
    
    
    //复用要把变化的改过来
    UILabel *laber=(UILabel *)[cell viewWithTag:100];
    UIImageView *imageView=(UIImageView *)[cell viewWithTag:200];
    
    if (isHit[indexPath.row])
    {
        
        imageView.height=cell.height-2;
    
     
        laber.height=cell.height-28;
        
    }
    else
    {
        imageView.height=48;
        laber.height=22;
    }
    
    
    
    return cell;
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (isHit[indexPath.row]) {
        
        CommentModel *modal=_commentArr[indexPath.row];
        CGFloat maxLabelWidth =kWidth-136;
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
        CGSize contenSize = [modal.content boundingRectWithSize:CGSizeMake(maxLabelWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        //NSLog(@"%f",contenSize.height+30-0.281);
        return contenSize.height+30-0.281;
    }
    else
    {
        return 50;
        
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    isHit[indexPath.row]=!isHit[indexPath.row];
    [tableView reloadData];
    
}

@end

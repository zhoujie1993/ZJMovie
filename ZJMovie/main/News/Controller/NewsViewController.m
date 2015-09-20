//
//  NewsViewController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "NewsViewController.h"
#import "Basedefine.h"
#import "DataService.h"
#import "NewsCell.h"
#import "NewModal.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
#import "NewImageListViewController.h"
#import "NewsDetailViewController.h"

#define kImageCount 5

static NSString *newsCellId = @"newsCellId";


@interface NewsViewController ()
{
    
    UIImageView *_headerImageView;
    UILabel *_headerLable;
}


@end

@implementation NewsViewController

#pragma mark - MainViewController
- (void)viewDidLoad {
    self.navigationController.navigationBar.translucent = YES;
    
    [super viewDidLoad];
    
    [self _createNewsList];
    [self _createHeaderView];
    [self _loadData];
    //[self _createScrollView];
    
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
        titleLabel.text = @"新闻";
        titleLabel.font = [UIFont boldSystemFontOfSize:24];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
         self.navigationItem.titleView =titleLabel;
    }
    return self;
}


#pragma mark - LoadData
- (void)_loadData{
    
    _newsModalArray = [[NSMutableArray alloc]init];
   
    NSArray *newsArrays = [DataService loadData:@"news_list.json"];    
    for (NSDictionary *dic in newsArrays) {
        NewModal *modal = [[NewModal alloc]init];
        
        [modal setValuesForKeysWithDictionary:dic];
        
        [_newsModalArray addObject:modal];
    }
    
    NewModal *modal = _newsModalArray[0];
    _headerLable.text = modal.title;
    
    NSURL *url = [NSURL URLWithString:modal.image];
    [_headerImageView sd_setImageWithURL:url];
    
    
    [_newsModalArray removeObjectAtIndex:0];
    
}


#pragma mark - CreateSubviews
-(void)_createHeaderView{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 200)];
    headerView.backgroundColor = [UIColor clearColor];
    _tableView.tableHeaderView = headerView;
    
    _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 200)];
    _headerLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kWidth, 30)];
    
   
    //UIViewEx 类目
    _headerLable.bottom = _headerImageView.bottom;
    _headerLable.textColor = [UIColor whiteColor];
    
    [self.view addSubview:_headerImageView];
    [self.view addSubview:_headerLable];
    
    
}
-(void)_createNewsList
{

    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    
    //_tableView.backgroundView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_main.png"]];
    _tableView.dataSource = self;
    _tableView.delegate =self;
    
    UINib *nib = [UINib nibWithNibName:@"NewsCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:newsCellId];
    
    
}






#pragma mark - Tool
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offY = scrollView.contentOffset.y;
    //NSLog(@"%f",offY);
    if (offY > -64) {//向上
        _headerImageView.top = -offY;
        
        
    }else{//向下
        CGFloat newHeight = ABS(offY)  -64+ 200;
        CGFloat newWidth = kWidth/200 * newHeight;
        
        _headerImageView.frame = CGRectMake((kWidth - newWidth)/2, 64, newWidth, newHeight);
    }
    
        _headerLable.bottom = _headerImageView.bottom;
    
}



#pragma mark - DataSoure
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    return [_newsModalArray count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCellId"];
    
    cell.news = _newsModalArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewModal *modal = _newsModalArray[indexPath.row];
    if (modal.type == 0) {
        NewsDetailViewController *vc = [[NewsDetailViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    NewImageListViewController *vc = [[NewImageListViewController alloc]init];
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

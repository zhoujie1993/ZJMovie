//
//  MovieViewController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieModal.h"
#import "MovieCell.h"
#import "UIImageView+WebCache.h"
#import "Basedefine.h"

@interface MovieViewController ()
{
    //BOOL isLeft;
}
@end

@implementation MovieViewController

#pragma mark - MainViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
        titleLabel.text = @"电影";
        //titleLabel.font = [UIFont systemFontOfSize:24]; //太细
        //titleLabel.font = [UIFont fontWithName:@"Helevetica-Bold" size:24];  不成功
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
    
    [self _createNav];
    
    [self _createMovieTableView];
    [self _createPosterView];
    [self _loadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//如果是多级控制器关系，这里不被调用
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

#pragma mark - LoadData
- (void)_loadData{
    
    _movieModalArray = [[NSMutableArray alloc]init];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"us_box.json" ofType:nil];
    //NSData直接存储二进制数据
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    //直接吧文件里面的数据 解析放到 数组或者字典
    NSDictionary *dataDic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *subjects = [dataDic objectForKey:@"subjects"];
    for (NSDictionary *dic in subjects) {
        NSDictionary *subject = [dic objectForKey:@"subject"];
        MovieModal *modal = [[MovieModal alloc]init];
        modal.title = [subject objectForKey:@"title"];
        modal.year = [subject objectForKey:@"year"];
        modal.images = [subject objectForKey:@"images"];
        modal.original_title = [subject objectForKey:@"original_title"];
        NSNumber *number = [[subject objectForKey:@"rating"] objectForKey:@"average"];
        modal.average = [number floatValue];
        //NSLog(@"%@",modal.title);
        [_movieModalArray addObject:modal];
        
    }
    
    
    _posterView.movieModalArray = _movieModalArray;
    
    
    
    
}



#pragma mark - CreateSubviews

- (void)_createNav
{
    self.navigationController.navigationBar.translucent = YES;
    self.tabBarController.tabBar.translucent =YES;
    UIView *fileView= [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    UIButton *btn1 =[UIButton buttonWithType:UIButtonTypeCustom];//设置按钮type为用户自定义
    [btn1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    btn1.tag =1;
    
    [btn1 sizeToFit];
    [btn1 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    [fileView addSubview:btn1];
    
    
    UIButton *btn2 =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    
    btn2.tag =2;//在按钮Action需要识别
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    [fileView addSubview:btn2];
    btn2.hidden =YES;
    
    /**
     sizeToFit
     自适应size能够装修所有子视图
     */
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:fileView];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)_createPosterView{
    _posterView = [[PosterView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    _posterView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_posterView];
}

- (void)_createMovieTableView{
    
//    self.automaticallyAdjustsScrollViewInsets =YES;
    _movieTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    _movieTableView.delegate = self;
    _movieTableView.dataSource =self;
    _movieTableView.hidden = YES;
    [self.view addSubview:_movieTableView];
    
    UINib *nib = [UINib nibWithNibName:@"MovieCell" bundle:[NSBundle mainBundle]];
    
    [_movieTableView registerNib:nib forCellReuseIdentifier:@"cell"];
}

#pragma mark - Action
- (void)flipAction:(UIButton *)btn
{
    UIView *flipView = self.navigationItem.rightBarButtonItem.customView;//***导航栏右边Item是全局按钮
    UIButton *btn1 = (UIButton*)[flipView viewWithTag:1];//***记住
    UIButton *btn2 = (UIButton*)[flipView viewWithTag:2];
    BOOL isLeft = btn2.hidden;
    //isLeft = !isLeft;全局变量时的方法
    
    [self _flipView:flipView isLeft:isLeft];
    [self _flipView:self.view isLeft:isLeft];
    
    btn1.hidden = !btn1.hidden;
    btn2.hidden = !btn2.hidden;
    
    _posterView.hidden = !_posterView.hidden;
    _movieTableView.hidden = !_movieTableView.hidden;
}


#pragma mark - Tool
- (void)_flipView:(UIView*)view isLeft:(BOOL)isLeft
{
    
    UIViewAnimationOptions option = isLeft ?UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight ;
    [UIView transitionWithView:self.view duration:.3 options:option animations:nil completion:nil];
}

#pragma mark - UITableView Delegate

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    NSArray *movieArray = [dic objectForKey:@"subjects"];
//    return [movieArray count];
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _movieModalArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //只要注册了 ，这里cell一定不为nil
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil)
//    {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
//    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    MovieModal *modal = _movieModalArray[indexPath.row];
    cell.modal =modal;
    
    return cell;
}
     
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
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

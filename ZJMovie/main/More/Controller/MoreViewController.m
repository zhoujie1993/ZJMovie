//
//  MoreViewController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "MoreViewController.h"
#import "Basedefine.h"
#import "SDImageCache.h"

@interface MoreViewController ()
{
    UITableView *_tableView;
    NSArray *_dataArray;
    NSArray *_dataArrayImageName;
}
@end

@implementation MoreViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
        titleLabel.text = @"更多";
        titleLabel.font = [UIFont boldSystemFontOfSize:24];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        self.navigationItem.titleView =titleLabel;
    }
    return self;
}

-(void)_createCinemasList
{
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 64) style:UITableViewStyleGrouped];
    
    _tableView.backgroundView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_main.png"]];
    _tableView.dataSource = self;
    _tableView.delegate =self;
    
    _dataArray = @[@"清除缓存",@"给个评价",@"检查新版本",@"商务合作",@"欢迎页",@"关于"];
    _dataArrayImageName = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    
    
    [self.view addSubview:_tableView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createCinemasList];
    //NSString *homePath = NSHomeDirectory();
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - DataSoure
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 6;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.image = [UIImage imageNamed:_dataArrayImageName[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    if (indexPath.row == 0) {
    
        SDImageCache *cache = [SDImageCache sharedImageCache];
        CGFloat size = [cache getSize];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1fM",size/1000/1000];
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确定清除所有缓存" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alert show];
    }
    
}

-  (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        SDImageCache *cache = [SDImageCache sharedImageCache];
        [cache clearDisk];
        NSLog(@"3333");
        [_tableView reloadData];
    }
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

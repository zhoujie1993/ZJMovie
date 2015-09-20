//
//  ZJTabBarController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "ZJTabBarController.h"
#import "MovieViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"
#import "ZJButton.h"
#import "BaseNavController.h"

@interface ZJTabBarController ()

@end

@implementation ZJTabBarController

-(void)_createViewControllers
{
    //第三层
    MovieViewController *vc1 = [[MovieViewController alloc] init];
    NewsViewController *vc2 = [[NewsViewController alloc] init];
    TopViewController *vc3 = [[TopViewController alloc] init];
    CinemaViewController *vc4 = [[CinemaViewController alloc] init];
    MoreViewController *vc5 = [[MoreViewController alloc] init];
    
    NSArray *vcAarray = @[vc1,vc2,vc3,vc4,vc5];
    
    //第二层
    
    NSMutableArray * navArray = [[NSMutableArray alloc]init];
    for (int i = 0 ; i<5; i ++) {
        BaseNavController *nav = [[BaseNavController alloc]initWithRootViewController:vcAarray[i]];
        [navArray addObject:nav];
    }
    self.viewControllers = navArray;
    
}

-(void)_setTabBar
{

    for (UIView * subView in self.tabBar.subviews) {
        
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([subView isKindOfClass:cls]) {
            [subView removeFromSuperview];
        }
    }
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    NSArray *imageName = @[@"movie_home.png",@"msg_select_new.png",@"start_top250.png",@"icon_cinema.png",@"more_setting.png"];
    NSArray *titles = @[@"电影",@"新闻",@"Top",@"影院",@"更多"];
    
    CGFloat width = CGRectGetWidth(self.tabBar.frame)/5;
    CGFloat height = CGRectGetHeight(self.tabBar.frame);
    
    _selectimageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    _selectimageView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [self.tabBar addSubview:_selectimageView];
    
    for (int i = 0 ; i<5 ;i++) {
        CGRect frame = CGRectMake(i * width, 0, width, height);
        ZJButton *button = [[ZJButton alloc]initWithFrame:frame withImageName:imageName[i] withTitle:titles[i]];
        button.tag  = i;
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
        
    }
    
    
}


- (void)btnAction:(UIButton *)btn
{
    
    NSInteger index = btn.tag;
    self.selectedIndex = index;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    _selectimageView.center = btn.center;
    
    [UIView commitAnimations];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createViewControllers];
    [self _setTabBar];
    // Do any additional setup after loading the view.
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

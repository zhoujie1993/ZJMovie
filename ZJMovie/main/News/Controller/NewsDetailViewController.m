//
//  NewsDetailViewController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/27.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 一  从网络直接加载
    //1.创建 web url
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
//    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
//    
//    //创建网络请求
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.view addSubview:web];
    
    //二从本地加载
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"news.html" ofType:nil];
    
    NSString *htmlStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    [web loadHTMLString:htmlStr baseURL:nil];
    
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

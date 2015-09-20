//
//  GuideViewController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/27.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "GuideViewController.h"
#import "LaunchViewController.h"
#import "Basedefine.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createSubView];
    // Do any additional setup after loading the view from its nib.
}

- (void)_createSubView{

    NSLog(@"%f",kWidth);
    for (NSInteger i =0 ; i <5; i++) {
        
        
        NSString *imageName = [NSString stringWithFormat:@"guide%ld@2x.png",i+1];
        NSString *pageImageName = [NSString stringWithFormat:@"guideProgress%ld@2x.png",i+1];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth *i, 0, kWidth, kHeight)];
        NSLog(@"%f",imageView.frame.origin.x);
        [imageView setImage:[UIImage imageNamed:imageName]];
        
        [_scrollView addSubview:imageView];
        
        
        
        
        
        
        UIImageView *pageImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kWidth - 173)/2 + kWidth * i, kHeight - 50, 173, 26)];
        [pageImageView setImage:[UIImage imageNamed: pageImageName]];
        [_scrollView addSubview:pageImageView];
        
        
    }
    
    
    _scrollView.bounces =NO;
    _scrollView.delegate = self ;
    _scrollView.contentSize = CGSizeMake(5*kWidth, kHeight);
    _scrollView.pagingEnabled = YES;
    
    [self.view addSubview:_btn];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / kWidth;
    
    if (index == 4) {
        _btn.hidden = NO;
    }else
    {
        _btn.hidden = YES;
    }
    NSLog(@"%d",_btn.hidden);
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

- (IBAction)btnAction:(id)sender {
    LaunchViewController *launch = [[LaunchViewController alloc]init];
    self.view.window.rootViewController = launch;
}
@end

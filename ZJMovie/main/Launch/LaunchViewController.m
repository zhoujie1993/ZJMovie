//
//  LaunchViewController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/27.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "LaunchViewController.h"
#import "ZJTabBarController.h"
#import "Basedefine.h"
#import "UIViewExt.h"


@interface LaunchViewController ()

@end

@implementation LaunchViewController
{
    NSMutableArray *imageViewArray;
    NSInteger index;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"Default"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame  = self.view.bounds;
    [self.view addSubview:imageView];
    
    //1.创建图片视图
    [self _createImageView];
    
    [self startAnimation];
    
    // Do any additional setup after loading the view.
}


- (void)_createImageView
{
    NSInteger count =24;
    CGFloat width = kWidth/4;
    CGFloat height = kHeight/6;
    
    CGFloat x = 0;
    CGFloat y = 0;
    
    imageViewArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i<count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        
        imageView.alpha = 0;
        NSString *imageName = [NSString stringWithFormat:@"%ld.png",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        [self.view addSubview:imageView];
        
        [imageViewArray addObject:imageView];
        
        if (i <= 3) {
            x = i*width;
            y = 0;
        }else if(i <= 8){
            x = kWidth - width;
            y = (i-3)*height;
        }else if(i <= 11)
        {
            x = kWidth - (i - 7)*width;
            y = kHeight - height;
        }else if(i <= 15)
        {
            x = 0;
            y = kHeight - (i - 10)*height;
        }else if(i <= 17)
        {
            x = (i - 15)*width;
            y = height;
            
        }else if(i <= 20)
        {
            x = 2 *width;
            y = (i -16) * height;
            
        }else if(i <= 23)
        {
            x = width;
            y = kHeight - (i - 19)*height;
            
        };
        
        imageView.frame = CGRectMake(x, y, width, height);
        
        [self.view addSubview:imageView];
        
        [imageViewArray addObject:imageView];
        
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView commitAnimations];
    index++;
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:.5];

}

- (void)startAnimation
{
    if (index >= imageViewArray.count) {
        
        //取得主窗口
        //1.
        //UIWindow *window = [UIApplication sharedApplication].keyWindow;
        //2.
        UIWindow *window = self.view.window;
        ZJTabBarController *mainCtrl = [[ZJTabBarController alloc]init];
        
        mainCtrl.view.transform = CGAffineTransformMakeScale(.2, .2);
        
        [UIView animateWithDuration:0.1 animations:^{
            mainCtrl.view.transform = CGAffineTransformIdentity;
        }];
        
        window.rootViewController = mainCtrl;
        return;
    }
    
    UIImageView *imageView = imageViewArray[index];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.1];
    imageView.alpha = 1;
    [UIView commitAnimations];
    
    index++;
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:.1];
    
}

- (BOOL)prefersStatusBarHidden{
    return YES;
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

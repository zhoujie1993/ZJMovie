//
//  GuideViewController.h
//  ZJMovie
//
//  Created by zhoujie on 15/7/27.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController<UIScrollViewDelegate>
{
    
    IBOutlet UIScrollView *_scrollView;

    IBOutlet UIButton *_btn;
}
- (IBAction)btnAction:(id)sender;

@end

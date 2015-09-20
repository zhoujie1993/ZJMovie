//
//  PosterView.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/24.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "PosterView.h"
#import "Basedefine.h"
#import "UIViewExt.h"
#import "MovieModal.h"
#import "MovieModal.h"
#define kHeaderViewH 136
#define kIndexCollectionViewH 100
#define kBottomTitleLableH 35
#define kBottomTitleLableY (kHeight-kTabBarHeight-kBottomTitleLableH)
#define kHeaderOffH   36
#define kPosterColletionViewY  (kHeaderViewH-kHeaderOffH)
#define kPosterColletionViewH  (kHeight-kPosterColletionViewY-kTabBarHeight-kBottomTitleLableH)

@implementation PosterView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createPosterCollectionView];
        
        [self _createCoverView];
        
        [self _createBottomTileLable];
        
        [self _createHeaderView];
        [self _createGesture];
        
        //增加观察者
        [_headerCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        [_posterCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSNumber *number = [change objectForKey:@"new"];
    NSInteger index = [number integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    //小海报动了
    if ([object isKindOfClass:[HeaderCollectionView class]] && _posterCollectionView.currentIndex != index) {
        [_posterCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _posterCollectionView.currentIndex = index;
        
    }else if([object isKindOfClass:[PosterCollectionView class]] && _headerCollectionView.currentIndex != index){
        [_headerCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _headerCollectionView.currentIndex =index;
    }
    
    MovieModal *modal = _movieModalArray[index];
    _bottomTitleLable.text = modal.title;
}


- (void)setMovieModalArray:(NSArray *)movieModalArray
{
    _movieModalArray = movieModalArray;
    _posterCollectionView.movieModalArray = movieModalArray;
    _headerCollectionView.movieModalArray = movieModalArray;
    //先创建 后赋值  所以只能放这
    MovieModal *modal=_movieModalArray[0];
    _bottomTitleLable.text=modal.title;
    
}


#pragma mark - CreateSubviews
//创建头视图
- (void)_createHeaderView{
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -kHeaderOffH, kWidth, kHeaderViewH)];
//    _headerView.backgroundColor = [UIColor greenColor];
    
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:_headerView.bounds];
    bgImageView.image = image;
    [_headerView addSubview:bgImageView];
    
    
    
    //小海报视图
    UIView *indexView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kIndexCollectionViewH)];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal ;

    _headerCollectionView = [[HeaderCollectionView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kIndexCollectionViewH) collectionViewLayout:layout];
    _headerCollectionView.itemWidth = kWidth/5;
    
    [indexView addSubview:_headerCollectionView];
    
    [_headerView addSubview:indexView];
    
    [self addSubview:_headerView];
    
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake((kWidth-20)/2, kHeaderViewH-25, 20, 20)];
    
    button.tag=100;
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    
    [button addTarget:self action:@selector(pullAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_headerView addSubview:button];
}

//创建大海报视图
-(void)_createPosterCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal ;
    _posterCollectionView = [[PosterCollectionView alloc]initWithFrame:CGRectMake(0, kPosterColletionViewY, kWidth, kPosterColletionViewH) collectionViewLayout:layout];
    
    _posterCollectionView.itemWidth = kWidth*3/4;
    
    [self addSubview:_posterCollectionView];
    
}

//创建底部标题视图
-(void)_createBottomTileLable{
    _bottomTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(0,kBottomTitleLableY, kWidth, kBottomTitleLableH)];
    _bottomTitleLable.backgroundColor = [UIColor grayColor];
    _bottomTitleLable.textColor = [UIColor whiteColor];
    _bottomTitleLable.textAlignment = NSTextAlignmentCenter;


    [self addSubview:_bottomTitleLable];
}

//创建蒙板

- (void)_createCoverView
{
    _coverView = [[UIControl alloc]initWithFrame:self.bounds];
    _coverView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
    _coverView.hidden = YES;
    
    
    [_coverView addTarget:self action:@selector(coverTapAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_coverView];
}

//清扫
- (void)_createGesture{
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDownAction)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipeDown];
}
#pragma mark - Action

- (void)swipeDownAction{
    
}
- (void)coverTapAction:(UIControl*)control
{
    
    [UIView beginAnimations:nil  context:nil];
    [UIView setAnimationDuration:.3];
   
    [self hideHeader];
    
    UIButton *button = (UIButton*)[_headerView viewWithTag:100];//注意这边要类型转化
    button.selected = !button.selected;
    
    [UIView commitAnimations];
    
}
- (void)pullAction:(UIButton*)button
{
    [UIView beginAnimations:nil  context:nil];
    [UIView setAnimationDuration:.3];
    //NSLog(@"%d",button.selected);初始为0点击button第一次进入次处还是为0
    if (button.selected == NO) {
        [self showHeader];
    }else{
        [self hideHeader];
    }
    button.selected = !button.selected;
    
    [UIView commitAnimations];
}

- (void)showHeader{
    _headerView.top = kNavHeight;//64
    _coverView.hidden = NO;
}

- (void)hideHeader{
    _headerView.top = -kHeaderOffH;//36
    _coverView.hidden = YES;
}
@end

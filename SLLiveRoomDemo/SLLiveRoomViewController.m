//
//  SLLiveRoomViewController.m
//  SLLiveRoomDemo
//
//  Created by xuqianlong on 16/7/6.
//  Copyright © 2016年 debugly. All rights reserved.
//

#import "SLLiveRoomViewController.h"
#import "SLLiveRoomViewController+Pan.h"

@interface SLLiveRoomViewController ()
{
    NSInteger idx;
}

@property (nonatomic,strong) UIColor *cbg;

@end

@implementation SLLiveRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panedView:)];
    [self.view addGestureRecognizer:panGes];
    
    self.cbg = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    
    self.panView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = self.cbg;
}

- (void)refreshBackgroundColor
{
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
}

///滑动的时候要切换背景
- (void)showNextAnchorBG
{
    [self refreshBackgroundColor];
}

- (void)showBeforeAnchorBG
{
    [self refreshBackgroundColor];
}

///没有达到预定的阈值，需要还原
- (void)showCurrentAnchorBG
{
    self.view.backgroundColor = self.cbg;
}

- (void)updateTitle:(NSString *)t
{
    UILabel *lb = [self.panView viewWithTag:10000];
    lb.text = t;
}

- (NSArray *)titles
{
    return @[@"搜狐视频",@"搜狐视频SDK",@"千帆SDK",@"千帆直播",@"搜狐新闻"];
}

///超过预定的阈值，展示上一个或者下一个主播
//这里只是改变下title，模拟切换房间

- (void)showAnchorImage
{
    UIImageView *imgView = [self.panView viewWithTag:20000];
    imgView.image = [UIImage imageNamed:@"Apple"];
    
    imgView.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        imgView.alpha = 1;
    }];
}

- (void)showNextAnchor
{
    idx ++;
    if (idx >= [[self titles]count]) {
        idx = 0;
    }
    NSString *t = [self titles][idx];
    [self updateTitle:t];
    
    self.cbg = self.view.backgroundColor;
    
    [self showAnchorImage];
}

- (void)showBeforeAnchor
{
    idx --;
    if (idx < 0) {
        idx = [[self titles]count]-1;
    }
    NSString *t = [self titles][idx];
    [self updateTitle:t];

    self.cbg = self.view.backgroundColor;
    
    [self showAnchorImage];
}

@end

//
//  SLLiveRoomViewController.h
//  SLLiveRoomDemo
//
//  Created by xuqianlong on 16/7/6.
//  Copyright © 2016年 debugly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLLiveRoomViewController : UIViewController

//其他view都加到这个上面，以便于跟着手势移动！
@property (weak, nonatomic) IBOutlet UIView *panView;


///滑动的时候要切换背景
- (void)showNextAnchorBG;
- (void)showBeforeAnchorBG;

///没有达到预定的阈值，需要还原
- (void)showCurrentAnchorBG;

///超过预定的阈值，展示上一个或者下一个主播
- (void)showNextAnchor;
- (void)showBeforeAnchor;

@end

//
//  SLLiveRoomViewController+Pan.h
//  SLLiveRoomDemo
//
//  Created by xuqianlong on 16/7/6.
//  Copyright © 2016年 debugly. All rights reserved.
//

#import "SLLiveRoomViewController.h"

typedef NS_ENUM(NSUInteger, SLPanGestureDirection) {
    SLPanGestureDirectionUnKnown,
    SLPanGestureDirectionLeft,
    SLPanGestureDirectionRight,
    SLPanGestureDirectionUp,
    SLPanGestureDirectionDown
};

@interface SLLiveRoomViewController (Pan)

- (void)panedView:(UIPanGestureRecognizer *)pan;

@end

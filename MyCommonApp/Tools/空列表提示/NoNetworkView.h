//
//  NoNetworkView.h
//  Finance
//
//  Created by 郝旭珊 on 2018/1/11.
//  Copyright © 2018年 郝旭珊. All rights reserved.
//  手机没有连网提示

#import <UIKit/UIKit.h>

@interface NoNetworkView : UIView
@property (nonatomic, copy) void(^_Nullable reloadEvent)(void);
@end

//
//  SeverErrorView.h
//  Finance
//
//  Created by 郝旭珊 on 2018/1/18.
//  Copyright © 2018年 郝旭珊. All rights reserved.
//  服务器出错提示

#import <UIKit/UIKit.h>

@interface SeverErrorView : UIView
@property (nonatomic, copy) void(^_Nullable reloadEvent)(void);
@end

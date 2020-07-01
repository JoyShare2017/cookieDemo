//
//  FaultNavView.h
//  MyKomastu2
//
//  Created by 赵帅 on 16/11/3.
//  Copyright © 2016年 lsj. All rights reserved.
//  假的导航栏  因为自定义的navigation 无法自定义返回按钮事件

#import <UIKit/UIKit.h>

@interface FaultNavView : UIView
@property(nonatomic,copy)NSString*title;
@property(nonatomic,copy)UBButton*back;
@property(nonatomic,strong) void (^backClick)(id obj);
@end

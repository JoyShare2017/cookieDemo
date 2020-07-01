//
//  NavigationController.h
//  D1CM
//
//  Created by 赵帅 on 2017/9/12.
//  Copyright © 2017年 lsj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavigationControllerDelegate <NSObject>
@optional
-(void)navigationControllerDelegateDidBack;
@end


@interface NavigationController : UINavigationController
@property (nonatomic,weak) id<NavigationControllerDelegate> navDelegate;
@end

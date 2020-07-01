//
//  AppDelegate.h
//  MyCommonApp
//
//  Created by apple on 2018/8/27.
//  Copyright © 2018年 emof. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;//生成纯色图片

@end


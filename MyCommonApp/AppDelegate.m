//
//  AppDelegate.m
//  MyCommonApp
//
//  Created by apple on 2018/8/27.
//  Copyright © 2018年 emof. All rights reserved.
//  2018-12-03 16:10:35上传到svn

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "IntroduceViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
   
    
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * str = (NSString*)[userDefaults objectForKey:@"GUIDE"];
        if (str.length == 0)
        {
            IntroduceViewController * introduceVC = [[IntroduceViewController alloc]init];
            self.window.rootViewController = introduceVC;
            [self.window makeKeyAndVisible];
    
        }else{
            if ([[LoginInfo getInstance].isLogin isEqualToString:@"1"]) {
                self.window.rootViewController=[RootTabbarController new];
            }else{
                self.window.rootViewController=[LoginViewController new];
            }
        }

    [self initIQkeyBoard];
    
    [self.window makeKeyAndVisible];

    return YES;
}
#pragma mark - 设置IQkeyboard键盘
-(void)initIQkeyBoard{
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量
    keyboardManager.enable = YES; // 控制整个功能是否启用
    keyboardManager.shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘
    keyboardManager.shouldToolbarUsesTextFieldTintColor = YES; // 控制键盘上的工具条文字颜色是否用户自定义
    keyboardManager.toolbarManageBehaviour = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    keyboardManager.enableAutoToolbar = YES; // 控制是否显示键盘上的工具条
    keyboardManager.shouldShowTextFieldPlaceholder = YES; // 是否显示占位文字
    keyboardManager.placeholderFont = [UIFont boldSystemFontOfSize:17]; // 设置占位文字的字体
    keyboardManager.keyboardDistanceFromTextField = 10.0f; // 输入框距离键盘的距离
}

- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

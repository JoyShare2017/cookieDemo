//
//  Macro.h
//  D1CM
//
//  Created by 赵帅 on 2017/9/12.工程
//  Copyright © 2017年 lsj. All rights reserved.
//

#ifndef Macro_h
#define Macro_h


//--------------------头文件

#import "RootTabbarController.h"


//接口地址
//#define ServerRootPath    @"http://192.168.2.250:8018/"
#define ServerRootPath    @"http://fxxc.ldynet.cn/" //正式地址



#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)


// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] < 8.0)
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define iOS9OrLater ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)

// 2.屏幕适配
#define SIZE [[UIScreen mainScreen] bounds].size
#define SWIDTH       [[UIScreen mainScreen]bounds].size.width
#define SHEIGHT      [[UIScreen mainScreen]bounds].size.height
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4Inch (IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 320.0)
#define IS_IPHONE_47Inch (IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 375.0)
#define IS_IPHONE_55Inch (IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 414.0)
#define IS_IPHONE_X (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height >= 800.0)

#define  LL_StatusBarHeight      (IS_IPHONE_X ? 44.f : 20.f)
// 3.弱引用
#define WEAKSELF typeof(self) __weak weakSelf = self;

//4.颜色
#define IWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define BACKGROUND IWColor(245, 246, 247)  //导航栏包裹的viewcontroller的默认背景颜色
#define LIGHTGRAY IWColor(203,206,214)   //浅灰色 比如分割线之类的


#define MAINCOLOR  IWColor(88, 194, 234)   //主体风格颜色

//常用系统颜色
#define KClearColor     [UIColor clearColor]
#define KWHITE_COLOR    [UIColor whiteColor]
#define KOranger_Color  [UIColor orangeColor]
#define KBlack_Color    [UIColor blackColor]
#define KDarkGray_Color    [UIColor darkGrayColor]
#define KGray_Color    [UIColor grayColor]
#define KLightGray_Color    [UIColor lightGrayColor]
#define KBLUE_COLOR     [UIColor blueColor]

//间距
#define MARGIN_BIG 20
#define MARGIN 10
#define MARGIN_SMALL 5
#define NEWSMUTILIMAGESHEIGHT (SIZE.width-60)/3   //多张图片时候图片高度



//--------------------打印------------------------

#ifdef DEBUG
#define KLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define KLog(format, ...)
#endif



/// ios 11 tabbar navbar高度
#define KNAVI_HEIGHT  ([UIScreen mainScreen].bounds.size.height >= 812.0 ? 88.0 : 64.0)
#define KTABBAR_HEIGHT  ([UIScreen mainScreen].bounds.size.height >= 812.0 ? 83.0 : 49.0)

#define KTOPHAIR_HEIGHT  ([UIScreen mainScreen].bounds.size.height >= 812.0 ? 24 : 0.0) //顶部刘海高度
#define KSAFEBAR_HEIGHT  ([UIScreen mainScreen].bounds.size.height >= 812.0 ? 34 : 0.0) //底部安全区域高度



//屏幕适配 宽高
#define KAuto_Width(value) ((value)/320.0f*[UIScreen mainScreen].bounds.size.width)
#define KAuto_Height(value) ((value)/568.0f*[UIScreen mainScreen].bounds.size.height)


// frame 相关
#define KFRAME(x,y,w,h) CGRectMake(x, y, w, h)




///时钟字体样式
#define KFONT_LED(a) [UIFont fontWithName:@"DBLCDTempBlack" size:(a)]
#define KFONT(a) [UIFont systemFontOfSize:(a)]

/** 沙盒路径 */
#define KDocumentPath       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/** 偏好 */
#define KUser_Default [NSUserDefaults standardUserDefaults]
/** 通知中心 */
#define KNotification_Center [NSNotificationCenter defaultCenter]
/** 获取系统版本 */
#define KIOS_Version_FloatValue [[[UIDevice currentDevice] systemVersion] floatValue]
/** 获取系统版本 */
#define KIOS_Version_String [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define KCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
/// 获取APP版本号
#define KAPP_VERSION [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"]
/// 获取系统版本号
#define KSYS_VERSION [[UIDevice currentDevice] systemVersion]

//检查系统版本
#define KSystem_Version_Equal_To(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define KSystem_Version_Greater_Than(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define KSystem_Version_Greater_Than_Or_Equal_To(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define KSystem_Version_Less_Than(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define KSystem_Version_Less_Than_Or_Equal_To(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//--------------------图片相关-------------------

//定义UIImage对象
#define KImageNamed(_pointer) [UIImage imageNamed:_pointer]


//-------------------颜色相关------------------
// rgb颜色转换（16进制->10进制）
#define KColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]





// tableview背景色
#define KTABLEVIEW_BACKGROUND_COLOR KColor_RGBA(232, 232, 232, 1)

//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)

#endif /* Macro_h */

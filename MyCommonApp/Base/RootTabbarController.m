//
//  RootTabbarController.m
//  D1CM
//
//  Created by 赵帅 on 2017/9/12.
//  Copyright © 2017年 lsj. All rights reserved.
//

#import "RootTabbarController.h"
#import "HomeViewController.h"
#import "MineViewController.h"


@interface RootTabbarController ()<UIAlertViewDelegate,UITabBarControllerDelegate>
@property(nonatomic,strong)NSMutableArray * controllers;
@property(nonatomic,strong)HomeViewController*homevc;
@property(nonatomic,strong)MineViewController*minevc;


@end

@implementation RootTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=KWHITE_COLOR;
    self.controllers = [NSMutableArray array];
    [self setUpViewControllers];
    self.tabBar.tintColor= MAINCOLOR;// backgroundImage=[AppDelegate imageWithColor: IWColor(115, 186, 71) size:CGSizeMake(SWIDTH, 49)];
    self.tabBarController.delegate=self;
    [self checkUpdate];
}

-(void)setUpViewControllers
{

    _homevc = [[HomeViewController alloc]init];
    [self setupChildViewController:_homevc title:@"首页" imageName:@"icon1_normal" selectedImageName:@"icon1_pressed"];


   

    _minevc = [[MineViewController alloc]init];
    [self setupChildViewController:_minevc title:@"我的" imageName:@"icon5_normal" selectedImageName:@"icon5_pressed"];
    
    self.viewControllers = self.controllers;
    
   
    
}

-(void)checkUpdate{
    [CommonRequest commonRequestWithServerName:@"member/index/check_banben_ios" andParams:@{}.mutableCopy andComplete:^(NetworkResult resultCode, id obj) {
        if (resultCode==NetworkResultSuceess) {
            NSDictionary*verDic=obj[@"data"];
            if ([verDic[@"mandatory"] isEqualToString:@"1"] )//1强制升级
            {
                [[KCCommonAlertBlock defaultAlertBlock]showAlertWithTitle:[NSString stringWithFormat:@"发现新版本%@,请升级",verDic[@"banbenhao"]] message:verDic[@"shuoming"] alertBlock:^(id obj) {
                    NSString*appPath= verDic[@"url"];
                    [self goToAppStoreWithUrl:appPath];
                }];
                
            }else{
                
                
                [[KCCommonAlertBlock defaultAlertBlock]showAlertWithTitle:[NSString stringWithFormat: @"发现新版本%@",verDic[@"banbenhao"]] CancelTitle:@"取消" ConfirmTitle:@"更新" message:verDic[@"shuoming"] cancelBlock:^(id obj) {
                    
                } confirmBlock:^(id obj) {
                    NSString*appPath= verDic[@"url"];
                    [self goToAppStoreWithUrl:appPath];
                }];
                
            }
            
        }
    }];
    

}

-(void)goToAppStoreWithUrl:(NSString*)urlStr{
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:urlStr]]) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlStr]];
        exit(0);
    }else{
        [[KCCommonAlertBlock defaultAlertBlock]showAlertWithTitle:@"提示" message:@"请打开App Store更新" alertBlock:^{
        }];
    }
}



-(void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //    设置控制器的属性
    childVC.title = title;
    //    设置图标
    childVC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //    设置选中的图标  禁用图片渲染
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    //     包装一个导航控制器
    self.nav = [[NavigationController alloc]initWithRootViewController:childVC];
    [self.controllers addObject:self.nav];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

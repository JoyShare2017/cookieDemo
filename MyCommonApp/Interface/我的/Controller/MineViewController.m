//
//  MineViewController.m
//  CarRepairExpert
//
//  Created by apple on 2018/7/13.
//  Copyright © 2018年 emof. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"
@interface MineViewController ()
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UBButton *btn = [UBButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    btn.backgroundColor = MAINCOLOR;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(20, SHEIGHT-KNAVI_HEIGHT-KTABBAR_HEIGHT-60, [UIScreen mainScreen].bounds.size.width-40, 40);
    [btn addAction:^(UBButton *button) {
        [[KCCommonAlertBlock defaultAlertBlock]showAlertWithTitle:@"提示" CancelTitle:@"取消" ConfirmTitle:@"确认" message:@"确认退出账号" cancelBlock:^{

        } confirmBlock:^{
            [[LoginInfo getInstance]resetUserInfo];
            LoginViewController*root =[LoginViewController new];
            AppDelegate*app =(AppDelegate*)[UIApplication sharedApplication].delegate;
            app.window.rootViewController=root;

        }];
    }];
    [self.view addSubview:btn];
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

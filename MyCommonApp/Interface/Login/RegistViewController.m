//
//  RegistViewController.m
//  MyCommonApp
//
//  Created by apple on 2018/11/30.
//  Copyright © 2018 emof. All rights reserved.
//

#import "RegistViewController.h"
#import "FaultNavView.h"
@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=KWHITE_COLOR;
    //弄假的导航栏
    FaultNavView*faultNav=[[FaultNavView alloc]initWithFrame:CGRectMake(0, 0, SWIDTH, KNAVI_HEIGHT)];
    faultNav.title=@"注册";
    faultNav.backClick = ^(id obj) {
        [self.view endEditing:YES];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    };
    [self.view addSubview:faultNav];
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

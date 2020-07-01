//
//  NavigationController.m
//  D1CM
//
//  Created by 赵帅 on 2017/9/12.
//  Copyright © 2017年 lsj. All rights reserved.
//

#import "NavigationController.h"
@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BACKGROUND;
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:17],NSFontAttributeName, nil];
    self.navigationBar.titleTextAttributes = dict;
    [self.navigationBar setBackgroundImage:[AppDelegate imageWithColor:MAINCOLOR size:CGSizeMake(SIZE.width, KNAVI_HEIGHT)] forBarMetrics:UIBarMetricsDefault];
    self.interactivePopGestureRecognizer.delegate = (id)self;//恢复自带的右滑手势
    [self.navigationBar setShadowImage:[UIImage new]];//去掉导航分割线

    
}
-(void)popself
{

    if([_navDelegate respondsToSelector:@selector(navigationControllerDelegateDidBack)])
    {
        [_navDelegate navigationControllerDelegateDidBack];
    }else{
        [self popViewControllerAnimated:YES];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (viewController.navigationItem.leftBarButtonItem== nil && [self.viewControllers count] >0)
        
    {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.view.backgroundColor=BACKGROUND;
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_return"] style:(UIBarButtonItemStylePlain) target:self action:@selector(popself)];
        viewController.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];

    }
    [super pushViewController:viewController animated:animated];
    
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

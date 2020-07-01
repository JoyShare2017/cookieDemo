//
//  HomeViewController.m
//  MyCommonApp
//
//  Created by apple on 2018/8/27.
//  Copyright © 2018年 emof. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableDictionary*mdic=[@{
                                       @"NICKNAME":@"欧巴",
                                    
                                       }mutableCopy];
    [CommonRequest commonRequestWithServerName:@"http://220.115.18.18:8001/fh-system/user/editUserOwn" andParams:mdic andComplete:^(NetworkResult resultCode, id obj) {
        //尝试放到github托管
        //再次尝试放到github托管再次尝试放到github托管再次尝试放到github托管再次尝试放到github托管再次尝试放到github托管再次尝试放到github托管再次尝试放到github托管再次尝试放到github托管再次尝试放到github托管再次尝试放到github托管再次尝试放到github托管再次尝试放到github托管
    }];
}



@end

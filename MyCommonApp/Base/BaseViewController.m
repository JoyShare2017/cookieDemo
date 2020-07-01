//
//  BaseViewController.m
//  MyCommonApp
//
//  Created by MAC on 2018/12/3.
//  Copyright © 2018年 emof. All rights reserved.
//

#import "BaseViewController.h"

typedef void (^Nav)(UIButton *);

@interface BaseViewController ()
@property (nonatomic, copy)Nav leftblock;
@property (nonatomic, copy)Nav rightblock;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//#pragma mark - 屏幕出现&屏幕消失
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//
//}
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//
//    [SVProgressHUD dismiss];
//}
//设置左侧nav
-(void)setNavLeftBtnWithImg:(NSString *)imgName title:(NSString *)title withBlock:(void (^)(UIButton *leftBtn))block{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0 , 0 , 44 , 44 );
    
    imgName = imgName==nil||[imgName isEqual:[NSNull null]]?@"fanhuijian":imgName;
    title = title==nil||[title isEqual:[NSNull null]]?@"":title;
    [leftBtn addTarget : self action : @selector (btnLeftClicked:) forControlEvents : UIControlEventTouchUpInside ];//设置按钮点击事件
    [leftBtn setTitle:[NSString stringWithFormat:@"%@",title] forState:UIControlStateNormal];
    
    [leftBtn setImage :[UIImage imageNamed:imgName] forState : UIControlStateNormal]; //设置按钮正常状态图片
    [leftBtn setImage :[UIImage imageNamed:imgName] forState : UIControlStateSelected ];//
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    
    UIBarButtonItem * leftBarButon = [[ UIBarButtonItem alloc ] initWithCustomView :leftBtn];
    if (([[[ UIDevice currentDevice ] systemVersion ] floatValue ]>= 7.0 ? 20 : 0 ))
    {
        UIBarButtonItem * negativeSpacer = [[UIBarButtonItem alloc ]
                                            initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                            target : nil
                                            action : nil ];
        negativeSpacer. width = - 10 ;//这个数值可以根据情况自由变化
        if ((imgName==nil||imgName.length<=0)&&title!=nil&&title.length>0) {
            negativeSpacer. width = -10 ;
            leftBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        }
        self.navigationItem.leftBarButtonItems = @[ negativeSpacer, leftBarButon ] ;
    } else{
        self.navigationItem.leftBarButtonItem = leftBarButon;
    }
    self.leftblock = block;
}

//设置右侧nav
- (void)setNavRightBtnWithImg:(NSString *)imgName title:(NSString *)title withBlock:(void (^)(UIButton *rightBtn))block{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(- 20 , 0 , 50 , 44 );
    if (imgName!=nil&&imgName.length>0&&title!=nil&&title.length>0) {
        rightBtn.frame = CGRectMake(-20, 0, 110, 44);
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        rightBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    title = title==nil||[title isEqual:[NSNull null]]?@"":title;
    [rightBtn addTarget : self action : @selector (btnRightClicked:) forControlEvents : UIControlEventTouchUpInside ];//设置按钮点击事件
    [rightBtn setTitle:title forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [rightBtn setTitleColor:IWColor(255, 255, 255) forState:UIControlStateNormal];
    [rightBtn setImage :[UIImage imageNamed:imgName] forState : UIControlStateNormal]; //设置按钮正常状态图片
    [rightBtn setImage :[UIImage imageNamed:imgName] forState : UIControlStateSelected ];//设置按钮选中图片
    //    rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 35, 0, 0);
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    UIBarButtonItem *rightBarButon = [[ UIBarButtonItem alloc ] initWithCustomView:rightBtn];
    if (([[[ UIDevice currentDevice ] systemVersion ] floatValue ]>= 7.0 ? 20 : 0 ))
    {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc ]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target : nil
                                           action : nil ];
        negativeSpacer. width = - 10 ;//这个数值可以根据情况自由变化
        self.navigationItem.rightBarButtonItems = @[ negativeSpacer, rightBarButon ] ;
    } else{
        self.navigationItem.rightBarButtonItem = rightBarButon;
    }
    self.rightblock = block;
}

//设置中间标题
- (void)setMiddletitle:(NSString *)title{
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.centerX =  SWIDTH/ 2;
    titleLabel.y = 0;
    titleLabel.width = SWIDTH / 5;
    titleLabel.height = 40;
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:19];
    titleLabel.textColor = IWColor(255, 255, 255);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
}

//点击左侧nav
- (void)btnLeftClicked:(UIButton *)leftNavBtn{
    
    self.leftblock(leftNavBtn);
}

//点击右侧nav
- (void)btnRightClicked:(UIButton *)rightBavBtn{
    
    self.rightblock(rightBavBtn);
}

@end

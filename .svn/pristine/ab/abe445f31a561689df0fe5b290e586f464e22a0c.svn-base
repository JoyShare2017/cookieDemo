//
//  ForgetPasswordVC.m
//  JingXinTong
//
//  Created by apple on 2018/7/11.
//  Copyright © 2018年 赵帅. All rights reserved.
//

#import "ForgetPasswordVC.h"
#import "RegExpManager.h"
#import "RegistHolderView.h"
#import "FaultNavView.h"
@interface ForgetPasswordVC ()<UITextFieldDelegate>
@property (nonatomic, strong) RegistHolderView *tfPhone,*tfYZMCode,*tfPassword,*tfpasswordAgain;

@property(nonatomic,strong)UBButton*sendBtn;
@property(nonatomic,strong)NSTimer*timer;
@property(nonatomic)int daojishi;

@end

@implementation ForgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=KWHITE_COLOR;
    
    //弄假的导航栏
    FaultNavView*faultNav=[[FaultNavView alloc]initWithFrame:CGRectMake(0, 0, SWIDTH, KNAVI_HEIGHT)];
    faultNav.title=@"找回密码";
    faultNav.backClick = ^(id obj) {
        [self.view endEditing:YES];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    };
    [self.view addSubview:faultNav];
    
    CGFloat marginTop=100;
    WEAKSELF
    
    NSArray*icons=@[@"iphone",@"yanzhengmma",@"mima"];
    NSArray*placeHolders=@[@"请输入手机号码",@"请输入验证码",@"请输入密码(不少于6位)"];
    
    for (int i=0; i<icons.count; i++) {
        RegistHolderView*holdview=[[RegistHolderView alloc]initWithFrame:KFRAME(10, marginTop+ (i*50), SWIDTH-20, 40)];
        
        holdview.tf.delegate=self;
        [holdview setLeftImage:@"ios"];
        holdview.tf.placeholder=placeHolders[i];

       if (i==0) {
            
           [holdview setType:TEXTFIELD_PHONENUMBER];
            self.tfPhone=holdview;
           self.sendBtn=holdview.sendBtn;
           [self.sendBtn addAction:^(UBButton *button) {
               [weakSelf beginTimerRun];
           }];
        }else if (i==1)  {
            [holdview setType:TEXTFIELD_YANZHNEGMA];
            holdview.supervc=self;
            self.tfYZMCode=holdview;
            
        }else{
            [holdview setType:TEXTFIELD_PASSWORD];
            self.tfPassword=holdview;
        }
        [self.view addSubview:holdview];
    }
    
//    UBLabel*warning=[UBLabel makeLabelWithFrame:KFRAME(SWIDTH*0.5-150, CGRectGetMaxY(_tfpasswordAgain.superview.frame), 300, 20) andText:@"密码格式为6-16位数字、字母或符号，不允许有空格" andTitleColor:KGray_Color andFont:12];
//    [warning setTextAlignment:(NSTextAlignmentCenter)];
//    [self.view addSubview:warning];
    
    //注册按钮
    UBButton*loginBtn=[UBButton makeButtonWithFrame:KFRAME(10, CGRectGetMaxY(_tfPassword.frame)+30, SWIDTH-20, 40) andTitle:@"提交" andTitleColor:KWHITE_COLOR andFont:16 andBackGroundColor:MAINCOLOR];
   
    [loginBtn addAction:^(UBButton *button) {
        [weakSelf judegAndRegist];
    }];
    [self.view addSubview:loginBtn];
    
//    UBLabel*regist=[UBLabel makeLabelWithFrame:KFRAME(SWIDTH*0.5-100, CGRectGetMaxY(loginBtn.frame)+10, 200, 20) andText:@"返回登录" andTitleColor:KGray_Color andFont:12];
//    [regist setTextAlignment:(NSTextAlignmentCenter)];
//    [regist addAction:^(UBLabel *label) {
//        [weakSelf  dismissViewControllerAnimated:YES completion:^{
//        }];
//    }];
//
//    [self.view addSubview:regist];
    
    
    
}
-(void)beginTimerRun{

    
    if (![RegExpManager validateContactPhone:self.tfPhone.tf.text] ) {
        [self showHint:@"请输入正确的手机号"];
        return;
    }
    WEAKSELF
    
    NSMutableDictionary*dic=[@{
                               @"user_name":self.tfPhone.tf.text
                               }mutableCopy];
    
    
    [CommonRequest commonRequestWithServerName:@"member/index/forget_password" andParams:dic andComplete:^(NetworkResult resultCode, id obj) {
        if (resultCode==NetworkResultSuceess) {
                        [weakSelf showHint:@"验证码已发至手机，请注意查收"];
                    }else{
                        [weakSelf showHint:(NSString *)obj];
                    }
        [weakSelf.tfYZMCode beginTimerRun];
    }];

    
    
    //20170506 获取验证码点击后就开始倒计时 不受结果提示影响
//    self.sendBtn.userInteractionEnabled=NO;
//    [self.sendBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
//    self.sendBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
//    //获取验证码的倒计时
//    _daojishi=0;
//    if (self.timer) {
//        [self.timer invalidate];
//    }
//    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerrun:) userInfo:nil repeats:YES];
//    [self.timer fire];
    
    
}



-(void)timerrun:(NSTimer*)timerr{
    _daojishi++;
    [_sendBtn setTitle:[NSString stringWithFormat:@"重发（%ds）",60-_daojishi] forState:(UIControlStateNormal)];
    [_sendBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
    _sendBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
    _sendBtn.userInteractionEnabled=NO;
    
    if (_daojishi>=60) {
        [_sendBtn setTitle:@"重发验证码" forState:(UIControlStateNormal)];
        _sendBtn.userInteractionEnabled=YES;
        [_sendBtn setTitleColor:MAINCOLOR forState:(UIControlStateNormal)];
        _sendBtn.layer.borderColor=MAINCOLOR.CGColor;
        [timerr invalidate];
    }
    
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{

    
//    if (textField == self.tfYZMCode||textField==self.tfPassword||textField==self.tfpasswordAgain){
//
//
//        self.view.frame=KFRAME(0, -150, SWIDTH, SHEIGHT+150);
//    }else{
//        self.view.frame=KFRAME(0, 0, SWIDTH, SHEIGHT);
//    }
}








-(void)judegAndRegist{
    
    for (RegistHolderView*theTf in self.view.subviews) {
        if (theTf.tag>=100&&theTf.tag!=104) {
            if (theTf.tf.text.length<=0) {
                [self showHint: theTf.tf.placeholder yOffset:-200];
                return;
            }
        }
    }
    
    
//    if (![RegExpManager validatePassword:self.tfPassword.text]) {
//        [self showHint:@"密码格式不正确,请重新输入" yOffset:-200];
//        return;
//
//    }
    
    
    [self showHudInView:self.view];
    WEAKSELF
    NSMutableDictionary*dic=[@{
                               @"user_name":self.tfPhone.tf.text,
                               @"phone_code":self.tfYZMCode.tf.text,
                               @"new_password":self.tfPassword.tf.text,
                               @"rnew_password":self.tfPassword.tf.text,

                               }mutableCopy];
    
    
    [CommonRequest commonRequestWithServerName:@"member/index/forget_password" andParams:dic andComplete:^(NetworkResult resultCode, id obj) {
        [weakSelf hideHud];
        if (resultCode==NetworkResultSuceess) {
            [weakSelf showHint:@"找回密码成功"];
                        [weakSelf dismissViewControllerAnimated:YES completion:^{
            
                        }];
            
        }else{
            [weakSelf showHint:obj];
        }
    }];

    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    self.view.frame=KFRAME(0, 0, SWIDTH, SHEIGHT);
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

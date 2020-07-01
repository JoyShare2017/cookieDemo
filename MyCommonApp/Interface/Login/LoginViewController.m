//
//  LoginViewController.m
//  BaiZhiFang
//
//  Created by 赵帅 on 2018/5/23.
//  Copyright © 2018年 赵帅. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPasswordVC.h"
#import "RegistViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *accountTF,*pwdTF;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"登录";
    self.view.backgroundColor=KWHITE_COLOR;
    UIImageView*bgBtn=[[UIImageView alloc]initWithFrame:KFRAME(0, 0, SWIDTH, SHEIGHT)];
    bgBtn.image=KImageNamed(@"bg");
    bgBtn.userInteractionEnabled=YES;
    [self.view addSubview:bgBtn];
    
    UIView*white=[[UIView alloc]initWithFrame:KFRAME(20,IS_IPHONE_X?SHEIGHT*0.25:SHEIGHT*0.15, SWIDTH-40, 300)];
    white.backgroundColor=KWHITE_COLOR;
    [bgBtn addSubview:white];
    
    
    UBLabel*lb=[UBLabel makeLabelWithFrame:KFRAME(0, 0, white.frame.size.width, 80) andText:@"登录程序" andTitleColor:KBlack_Color andFont:18];
    [lb setTextAlignment:(NSTextAlignmentCenter)];
    [white addSubview:lb];
    
    for (int i=0; i<2; i++) {
        UITextField*tf=[[UITextField alloc]initWithFrame:KFRAME(20, CGRectGetMaxY(lb.frame)+i*50, white.frame.size.width-40, 40)];
        UIButton*LogoBtn=[[UBButton alloc]initWithFrame:KFRAME(0, 0, 40, 40)];
        [LogoBtn setImage:[UIImage imageNamed:@[@"iphone",@"mima"][i]] forState:(UIControlStateNormal)];
        [tf setLeftViewMode:(UITextFieldViewModeAlways)];
        [tf setLeftView:LogoBtn];
        [tf setReturnKeyType:(UIReturnKeyDone)];
        tf.delegate=self;
        tf.placeholder=@[@"请输入手机号码",@"请输入密码"][i];
        tf.textColor=MAINCOLOR;
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSForegroundColorAttributeName] = IWColor(159, 198, 210);
        NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:tf.placeholder attributes:dict];
        [tf setAttributedPlaceholder:attribute];
        
        
       
        tf.layer.cornerRadius=5;
        tf.layer.borderWidth=0.8;
        tf.layer.masksToBounds=YES;
        tf.layer.borderColor=KLightGray_Color.CGColor;
        [tf setAutocapitalizationType:(UITextAutocapitalizationTypeNone)];
        if (i==0) { self.accountTF=tf;
            [self.accountTF setKeyboardType:(UIKeyboardTypePhonePad)];
        }else if (i==1){self.pwdTF=tf;
            self.pwdTF.secureTextEntry=YES;
        }
        [white addSubview:tf];
    }
    
    
    UBButton*loginBtn=[UBButton makeButtonWithFrame:KFRAME(20, CGRectGetMaxY(_pwdTF.frame)+20, white.frame.size.width-40, 40) andTitle:@"登录" andTitleColor:KWHITE_COLOR andFont:16 andBackGroundColor:MAINCOLOR];
    
    WEAKSELF
    [loginBtn addAction:^(UBButton *button) {
        if (weakSelf.accountTF.text.length==0) {
            [weakSelf showHint:@"请输入用户名"];
            [self.accountTF becomeFirstResponder];
            return ;
        }
        if (weakSelf.pwdTF.text.length==0) {
            [weakSelf showHint:@"请输入密码"];
            [self.pwdTF becomeFirstResponder];

            return ;
        }
        [self showHudInView:self.view];
        
        NSMutableDictionary*mdic=[@{
                                    @"KEYDATA":@"qq361156753fh13193337134,fh,123456",
                                    @"tm":@"1582513081000"
                                    }mutableCopy];
        [CommonRequest commonRequestWithServerName:@"http://220.115.18.18:8001/fh-system/admin/check" andParams:mdic andComplete:^(NetworkResult resultCode, id obj) {
            [weakSelf hideHud];
//            if (resultCode==NetworkResultSuceess) {
            
                RootTabbarController*root =[RootTabbarController new];
                AppDelegate*app =(AppDelegate*)[UIApplication sharedApplication].delegate;
                app.window.rootViewController=root;
                [CommonRequest registPushWithCid:[LoginInfo getInstance].getuiCid andComplete:^(BOOL success, id obj) {
                    
                }];
            
//            }else{
//                [weakSelf showEmptyDataWithErrorCode:resultCode andView:weakSelf.view andDataCount:0 andOffset:0 andReloadEvent:^(id obj) {
//
//                }];
//                [weakSelf showHint:(NSString *)obj];
//            }
        }];
        
        
    }];
    [white addSubview:loginBtn];
    
    UBLabel*forgetlb=[UBLabel makeLabelWithFrame:KFRAME(white.frame.size.width*0.5-40, white.frame.size.height-60, 80, 30) andText:@"忘记密码?" andTitleColor:KLightGray_Color andFont:14];
    [forgetlb setTextAlignment:(NSTextAlignmentCenter)];
    [forgetlb addAction:^(UBLabel *label) {
        [weakSelf presentViewController:[ForgetPasswordVC new] animated:YES completion:^{
            
        }];
    }];
    [white addSubview:forgetlb];
    
    
    UBLabel*registLb=[UBLabel makeLabelWithFrame:KFRAME(self.view.frame.size.width*0.5-40, self.view.frame.size.height-60-KSAFEBAR_HEIGHT, 80, 30) andText:@"注册账号" andTitleColor:KLightGray_Color andFont:14];
    [registLb setTextAlignment:(NSTextAlignmentCenter)];
    [registLb addAction:^(UBLabel *label) {
        [weakSelf presentViewController:[RegistViewController new] animated:YES completion:^{
            
        }];
    }];
    [self.view addSubview:registLb];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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

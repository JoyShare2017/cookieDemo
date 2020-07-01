//
//  RegistHolderView.m
//  JingXinTong
//
//  Created by 赵帅 on 2018/6/10.
//  Copyright © 2018年 赵帅. All rights reserved.
//

#import "RegistHolderView.h"
#import "RegExpManager.h"
@interface RegistHolderView()
@property(nonatomic,strong)NSTimer*timer;
@property(nonatomic)int daojishi;
@end

@implementation RegistHolderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth=0.8;
        self.layer.masksToBounds=YES;
        self.layer.borderColor=KLightGray_Color.CGColor;
        self.tf=[[UITextField alloc]initWithFrame:KFRAME(0, 0, frame.size.width, 40)];
        [self.tf setAutocapitalizationType:(UITextAutocapitalizationTypeNone)];
        self.tf.font=[UIFont systemFontOfSize:14];

        [self addSubview:self.tf];
    }
    return self;
}
-(void)setType:(enum TEXTFIELDTYPE)type{
    _type=type;
    if (_type==TEXTFIELD_PHONENUMBER){
        [self.tf setKeyboardType:(UIKeyboardTypeNumberPad)];
    }
    else  if (_type==TEXTFIELD_YANZHNEGMA) {
        
        CGRect rec =self.tf.frame;
        rec.size.width=rec.size.width-100;
        self.tf.frame=rec;
        [self.tf setKeyboardType:(UIKeyboardTypeNumberPad)];
        
        _sendBtn=[UBButton makeButtonWithFrame:KFRAME(self.frame.size.width-100, 5, 90, 30) andTitle:@"获取验证码" andTitleColor:KWHITE_COLOR andFont:14 andBackGroundColor:MAINCOLOR];
        [self addSubview:_sendBtn];
    }else if (_type==TEXTFIELD_PASSWORD){
        _tf.secureTextEntry=YES;
        [_tf setClearButtonMode:(UITextFieldViewModeWhileEditing)];
        
        CGRect rec =self.tf.frame;
        rec.size.width=rec.size.width-40;
        self.tf.frame=rec;
        
        UBButton*eye=[[UBButton alloc]initWithFrame:KFRAME(self.frame.size.width-40, 0, 30, 40)];
        [eye setImage:KImageNamed(@"login_eye_close") forState:(UIControlStateNormal)];
        [eye setImage:KImageNamed(@"login_eye") forState:(UIControlStateSelected)];
        [self addSubview:eye];
        WEAKSELF
        [eye addAction:^(UBButton *button) {
            button.selected=!button.selected;
            weakSelf.tf.secureTextEntry=!button.selected;
        }];
    }
}
-(void)beginTimerRun{
    if (_type==TEXTFIELD_YANZHNEGMA) {
        [self.sendBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        self.sendBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
        //获取验证码的倒计时
        _daojishi=0;
        if (self.timer) {
            [self.timer invalidate];
        }
        NSTimer*timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerrun:) userInfo:nil repeats:YES];
        [timer fire];
    }
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

-(void)setLeftImage:(NSString*)imgName{
    if (imgName.length>0) {
        UIButton*LogoBtn=[[UBButton alloc]initWithFrame:KFRAME(0, 0, 40, 40)];
        [LogoBtn setImage:[UIImage imageNamed:imgName] forState:(UIControlStateNormal)];
        [self addSubview:LogoBtn];
        
        CGRect rec =self.tf.frame;
        rec.origin.x=40;
        rec.size.width=rec.size.width-40;
        self.tf.frame=rec;
    }
}

@end

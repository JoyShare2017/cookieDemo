//
//  FaultNavView.m
//  MyKomastu2
//
//  Created by 赵帅 on 16/11/3.
//  Copyright © 2016年 lsj. All rights reserved.
//

#import "FaultNavView.h"

@interface FaultNavView ()
@property(nonatomic,strong) UILabel*titleLb;
@end

@implementation FaultNavView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=MAINCOLOR;
        _back=[[UBButton alloc]initWithFrame:CGRectMake(0, 20+KTOPHAIR_HEIGHT, 44, 44)];
        [_back setImage:[UIImage imageNamed:@"icon_return"] forState:(UIControlStateNormal)];
        WEAKSELF
        [_back addAction:^(UBButton *button) {
            if (weakSelf.backClick) {
                weakSelf.backClick(@"");
            }
        }];
        [self addSubview:_back];
        
       _titleLb = [[UILabel alloc]initWithFrame:CGRectMake(SWIDTH*0.5-100, 20+KTOPHAIR_HEIGHT, 200, 44)];
        _titleLb.textColor=[UIColor whiteColor];
        [_titleLb setTextAlignment:(NSTextAlignmentCenter)];
        _titleLb.font=[UIFont boldSystemFontOfSize:17];
        [self addSubview:_titleLb];
        
        
    }
    return self;
}


-(void)setTitle:(NSString *)title{

    _titleLb.text=title;

}

@end

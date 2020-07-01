//
//  RegistHolderView.h
//  JingXinTong
//
//  Created by 赵帅 on 2018/6/10.
//  Copyright © 2018年 赵帅. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,TEXTFIELDTYPE) {
        TEXTFIELD_YANZHNEGMA=0,
        TEXTFIELD_PASSWORD,
        TEXTFIELD_PHONENUMBER

};
@interface RegistHolderView : UIView
@property (nonatomic, strong) UITextField *tf;
@property(nonatomic,assign)enum TEXTFIELDTYPE type;
@property (nonatomic, strong) UIViewController  *supervc;
@property(nonatomic,strong)UBButton*sendBtn;

@property (nonatomic, strong) void (^yzmbtnClick)(id obj);
-(void)beginTimerRun;
-(void)setLeftImage:(NSString*)imgName;
@end

//
//  EN_UserModel.h
//  JingXinTong
//
//  Created by apple on 2018/7/5.
//  Copyright © 2018年 赵帅. All rights reserved.
//  fmdb数据库 EN_UserModel

#import <Foundation/Foundation.h>

@interface EN_UserModel : NSObject
//头像
@property (nonatomic, copy) NSString *headimg;
//昵称
@property (nonatomic, copy) NSString *user_name;//其实是手机号

@property (nonatomic, copy) NSString *realname,*duty,*socialduty,*isFriend;
@property (nonatomic, copy) NSString *extra1;//备用
@end

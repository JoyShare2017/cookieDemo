//
//  LoginInfo.h
//  BaiZhiFang
//
//  Created by 赵帅 on 2018/5/22.
//  Copyright © 2018年 赵帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginInfo : NSObject
+(LoginInfo*)getInstance;
@property (nonatomic, copy) NSString *isLogin;
@property (nonatomic, copy) NSString *user_lock,*user_id,*user_name,*user_is_del,*user_group;

@property(nonatomic,copy)NSString* getuiCid;
-(void)saveUserInfoWithDic:(NSDictionary*)dic;
-(void)getUserInfo;
-(void)resetUserInfo;


@end

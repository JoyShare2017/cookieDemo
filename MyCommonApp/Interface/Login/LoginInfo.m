//
//  LoginInfo.m
//  BaiZhiFang
//
//  Created by 赵帅 on 2018/5/22.
//  Copyright © 2018年 赵帅. All rights reserved.
//

#import "LoginInfo.h"
#import <objc/runtime.h>
@implementation LoginInfo
+(LoginInfo*)getInstance
{
    static LoginInfo *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{

        instance = [[self alloc]init];
    });

    return instance;
}
-(instancetype)init
{
    self = [super init];
    if (self)
    {
//        [self getAllPropertyName]; 
    }
    return self;
}
-(void)saveUserInfoWithDic:(NSDictionary*)dic{

    NSString*userid=[NSString stringWithFormat:@"%@",dic[@"user_id"]];


    if (userid.length>0) {
        [KUser_Default setObject:@"1" forKey:@"isLogin"];
    }else{
        [KUser_Default setObject:@"0" forKey:@"isLogin"];
    }

    [KUser_Default setObject:dic[@"user_id"] forKey:@"user_id"];
    [KUser_Default setObject:dic[@"user_name"] forKey:@"user_name"];
    [KUser_Default setObject:dic[@"user_lock"] forKey:@"user_lock"];
    [KUser_Default setObject:dic[@"user_is_del"] forKey:@"user_is_del"];
    [KUser_Default setObject:dic[@"user_group"] forKey:@"user_group"];
    
   
    [KUser_Default setObject:dic[@"danwei_id"] forKey:@"danwei_id"];
    
    [self transInfoFromUDToLoginInfo];
}
-(void)getUserInfo{
    [self transInfoFromUDToLoginInfo];
}
-(void)resetUserInfo{

    [KUser_Default setObject:@"0" forKey:@"isLogin"];
    [KUser_Default setObject:@"" forKey:@"user_id"];
    [KUser_Default setObject:@"" forKey:@"user_name"];
    [KUser_Default setObject:@"" forKey:@"user_lock"];
    [KUser_Default setObject:@"" forKey:@"user_is_del"];
    [KUser_Default setObject:@"" forKey:@"user_group"];



    
  
   
    LoginInfo*loginfo=[LoginInfo getInstance];
    [loginfo setIsLogin:[KUser_Default objectForKey:@"isLogin"]];
    [loginfo setUser_id:[KUser_Default objectForKey:@"user_id"]];
    [loginfo setUser_name:[KUser_Default objectForKey:@"user_name"]];
     [loginfo setUser_is_del:[KUser_Default objectForKey:@"user_is_del"]];
    [loginfo setUser_lock:[KUser_Default objectForKey:@"user_lock"]];
   
}



/**
 *  把 userdefault 里面的资料赋值给 logininfo
 **/
-(void)transInfoFromUDToLoginInfo{
    LoginInfo*loginfo=[LoginInfo getInstance];
    [loginfo setIsLogin:[KUser_Default objectForKey:@"isLogin"]];
    [loginfo setUser_id:[KUser_Default objectForKey:@"user_id"]];
    [loginfo setUser_name:[KUser_Default objectForKey:@"user_name"]];
    [loginfo setUser_is_del:[KUser_Default objectForKey:@"user_is_del"]];
    [loginfo setUser_group:[KUser_Default objectForKey:@"user_group"]];
}
- (NSArray*)getAllPropertyName//runtime获取model所有属性
{
    NSMutableArray* nameArray = [NSMutableArray array];
    unsigned int count = 0;
    objc_property_t *property_t = class_copyPropertyList([LoginInfo class], &count);
    for (int i=0; i<count; i++) {
        objc_property_t propert = property_t[i];
        const char * propertyName = property_getName(propert);
        [nameArray addObject:[NSString stringWithUTF8String:propertyName]];
        
    }
    free(property_t);
    NSLog(@"nameArray%@",nameArray);
    return nameArray;
    
}


@end

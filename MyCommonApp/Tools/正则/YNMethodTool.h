//
//  YNMethodTool.h
//  SocialOrganization
//
//  Created by 赵帅 on 2018/8/9.
//  Copyright © 2018年 Ynn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YNMethodTool : NSObject

//MD5加密 16位 大写
+ (NSString *)MD5ForUpper16Bate:(NSString *)str;

//MD5加密 32位 大写
+ (NSString *)MD5ForUpper32Bate:(NSString *)str;

//时间戳转日期 年月日
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;

//时间戳转日期 月 日 时 分
+ (NSString *)imTimeWithTimeIntervalString:(NSString *)timeString;

//时间戳转日期 年 月 日 时 分
+ (NSString *)workTimeWithTimeIntervalString:(NSString *)timeString;
//字典转json串
+(NSString*)returnDictionaryToJson:(NSDictionary *)dic;
//获取当前时间戳秒
+(NSString *)getNowTimeTimestamp;

//判断一个字符串是否是纯中文字符
+ (BOOL)isChinese:(NSString *)userName;
//身份证
+ (BOOL) IsIdentityCard:(NSString *)IDCardNumber;


@end

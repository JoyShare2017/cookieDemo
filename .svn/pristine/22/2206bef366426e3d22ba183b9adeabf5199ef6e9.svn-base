//
//  RegExpManager.h
//  ErShouJi
//
//  Created by  apple on 13-6-8.
//  Copyright (c) 2013年  apple. All rights reserved.
//

/*!
 @class         RegExpManager
 @author        赵帅
 @version       1.0
 @discussion	正则表达式管理器。
 */
#import <Foundation/Foundation.h>

@interface RegExpManager : NSObject
+(BOOL)validateNumberWithoutZero:(NSString*)str;
+(BOOL)validateNumber:(NSString*)str;
+(BOOL)validatePrice:(NSString*)str;
+(BOOL)validateNumberLetterBtolineCombined:(NSString*)str;
/**
 *  检查是否是有效的日期
 *
 *  @param str 日期字符串
 *
 *  @return YES:有效,NO:无效
 */
+(BOOL)validateDate:(NSString*)str;
/**
 *  检查是否是手机号

 */
+(BOOL)validateContactPhone:(NSString*)str;
/**
 *  判断小时数的正则

 */
+(BOOL)validateHour:(NSString*)str;


/**
 *  过滤特殊字符的正则
 */
+(NSString *)deleteIllegalCharWith:(NSString *)searchStr;
@end

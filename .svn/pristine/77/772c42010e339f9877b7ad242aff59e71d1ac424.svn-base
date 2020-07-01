//
//  RegExpManager.m
//  ErShouJi
//
//  Created by  apple on 13-6-8.
//  Copyright (c) 2013年  apple. All rights reserved.
//

#import "RegExpManager.h"

@implementation RegExpManager

//是否符合 1-9
+(BOOL)validateNumberWithoutZero:(NSString*)str
{
    //正则
    NSString* patternStr = @"^[1-9]$";
    NSRegularExpression* regexp = [[NSRegularExpression alloc]initWithPattern:patternStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberOfMatch = [regexp numberOfMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    if(numberOfMatch > 0)
    {
        return YES;
    }
    return NO;
}
+(BOOL)validateNumber:(NSString*)str
{
    NSString* patternStr = @"^[0-9]$";
    NSRegularExpression* regexp = [[NSRegularExpression alloc]initWithPattern:patternStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberOfMatch = [regexp numberOfMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    if(numberOfMatch > 0)
    {
        return YES;
    }
    return NO;
}
+(BOOL)validatePrice:(NSString*)str
{
    NSString* patternStr = @"^[1-9][0-9]{0,9}(\\.?|\\.[0-9]{0,2})$";
    NSRegularExpression* regexp = [[NSRegularExpression alloc]initWithPattern:patternStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberOfMatch = [regexp numberOfMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    if(numberOfMatch > 0)
    {
//        NSLog(@"str.length is %d and numberOfMatch is %d",str.length,numberOfMatch);
        return YES;
    }
    return NO;
}
+(BOOL)validateNumberLetterBtolineCombined:(NSString*)str
{
    NSString* patternStr = @"^[0-9a-zA-Z\\/\\-]{1,20}$";
    NSRegularExpression* regexp = [[NSRegularExpression alloc]initWithPattern:patternStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberOfMatch = [regexp numberOfMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    if(numberOfMatch > 0)
    {
        return YES;
    }
    return NO;
}
/**
 *  检查是否是有效的日期
 *
 *  @param str 日期字符串
 *
 *  @return YES:有效,NO:无效
 */
+(BOOL)validateDate:(NSString*)str
{
    NSString* patternStr =  @"^[2-9][0-9]{3}-(0[1-9]|1[0-2])-((0[1-9])|((1|2)[0-9])|30|31)$";
    NSRegularExpression* regexp = [[NSRegularExpression alloc]initWithPattern:patternStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberOfMatch = [regexp numberOfMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    if(numberOfMatch > 0)
    {
        return YES;
    }
    return NO;
}
/**
 *  检查是否是有效的手机号码

 */
+(BOOL)validateContactPhone:(NSString*)str
{
    NSString* patternStr =  @"^1[0-9]{10}$";
    NSRegularExpression* regexp = [[NSRegularExpression alloc]initWithPattern:patternStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberOfMatch = [regexp numberOfMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    if(numberOfMatch > 0)
    {
        return YES;
    }
    return NO;
}

+(BOOL)validateHour:(NSString*)str
{
    NSString* patternStr = @"^[1-9][0-9]{0,9}(\\.?|\\.[0-9]{0,1})$";
    NSRegularExpression* regexp = [[NSRegularExpression alloc]initWithPattern:patternStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberOfMatch = [regexp numberOfMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    if(numberOfMatch > 0)
    {
        //        NSLog(@"str.length is %d and numberOfMatch is %d",str.length,numberOfMatch);
        return YES;
    }
    return NO;
}

+(NSString *)deleteIllegalCharWith:(NSString *)searchStr
{
    NSLog(@"原文字%@",searchStr);
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];

    NSString *trimmedString = [searchStr stringByTrimmingCharactersInSet:set];

    NSLog(@"去除特殊字符后%@",trimmedString);

    
    return trimmedString;
}

@end

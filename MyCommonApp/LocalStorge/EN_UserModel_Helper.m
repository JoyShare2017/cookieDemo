//
//  EN_UserModel_Helper.m
//  JingXinTong
//
//  Created by apple on 2018/7/5.
//  Copyright © 2018年 赵帅. All rights reserved.
//

#import "EN_UserModel_Helper.h"
#define _NAME_DATABASE @"jxt.db"
#import "FMDatabaseAdditions.h"
#import "QueueFetcher.h"

@implementation EN_UserModel_Helper
{
    FMDatabase* db;
    NSString* TABLE_NAME;           //表名字
    NSString* HEADIMG;
    NSString* USER_NAME;
    NSString *REALNAME;
    NSString *DUTY;
    NSString *SOCIALDUTY;
    NSString *ISFRIEND;
    NSString *EXTRA1;
    
}
+(EN_UserModel_Helper*)getInstance{
    static EN_UserModel_Helper* instance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        
        instance = [[self alloc]init];
        [instance onCreate];
        [instance onCreateTable];
    });
    
    return instance;
}
-(instancetype)init
{
    self = [super init];
    
    if(self)
    {
        TABLE_NAME = @"en_usermodel";
        HEADIMG = @"headimg";
        USER_NAME=@"user_name";
        REALNAME=@"realname";
        DUTY=@"duty";
        SOCIALDUTY=@"socialduty";
        ISFRIEND=@"isFriend";
        EXTRA1=@"extra1";
        
    }
    
    return self;
}
/**
 *  创建数据库
 */
-(void)onCreate
{
    NSString* docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString* dpPath = [docsPath stringByAppendingPathComponent:_NAME_DATABASE];
    db = [FMDatabase databaseWithPath:dpPath];
}
/**
 *  创建表
 *
 *  @return YES:创建表成功 NO:创建表失败
 */
-(BOOL)onCreateTable
{
    __block BOOL res = NO;
    
    dispatch_sync([QueueFetcher getInstance].dbQueue, ^{
        if([db open])
        {
            NSString* sqlCreateTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS  '%@' ('%@' TEXT, '%@' TEXT, '%@' TEXT, '%@' TEXT, '%@' TEXT, '%@' TEXT, '%@' TEXT)", TABLE_NAME,USER_NAME,REALNAME,HEADIMG,DUTY,SOCIALDUTY,ISFRIEND,EXTRA1];
            [db beginTransaction];
            res = [db executeUpdate:sqlCreateTable];
            if(res)
            {
                NSLog(@"创建表成功 %@",TABLE_NAME);
            }
            else
            {
                NSLog(@"创建表失败 %@",TABLE_NAME);
            }
            [db commit];
            [db close];
        }
    });
    
    return res;
}
-(BOOL)insertOneData:(EN_UserModel*)enData{
    if ([self isOneDataExist:enData.user_name]) {
        return [self updateOneData:enData];
    }
    
    __block BOOL res = NO;
    dispatch_sync([QueueFetcher getInstance].dbQueue, ^{
        
        if ([db open])
        {
            NSString *insertSql= [NSString stringWithFormat:
                                  @"INSERT INTO '%@' ('%@', '%@', '%@', '%@', '%@', '%@', '%@') VALUES ('%@', '%@', '%@', '%@', '%@', '%@', '%@')",
                                  TABLE_NAME,
                                  USER_NAME,REALNAME,HEADIMG,DUTY,SOCIALDUTY,ISFRIEND,EXTRA1,
                                  enData.user_name,enData.realname,enData.headimg,enData.duty,enData.socialduty,enData.isFriend,enData.extra1];
            [db beginTransaction];
            
            res = [db executeUpdate:insertSql];
            if (res)
            {
                NSLog(@"insertOneData成功 %@",TABLE_NAME);
            }
            else
            {
                NSLog(@"insertOneData失败 %@",TABLE_NAME);
            }
            [db commit];
            [db close];
        }
    });
    
    return res;
}



-(BOOL)updateOneData:(EN_UserModel*)enData{
    __block BOOL res = NO;
    dispatch_sync([QueueFetcher getInstance].dbQueue, ^{
        
        if ([db open])
        {
            NSString *updateSql = [NSString stringWithFormat:@"UPDATE %@ SET %@ = '%@', %@ = '%@', %@ = '%@', %@ = '%@', %@ = '%@', %@ = '%@', %@ = '%@' WHERE %@ = '%@'", TABLE_NAME,
                                   USER_NAME,enData.user_name,
                                   REALNAME,enData.realname,
                                   HEADIMG,enData.headimg,
                                   DUTY,enData.duty,
                                   SOCIALDUTY,enData.socialduty,
                                   ISFRIEND,enData.isFriend,
                                   EXTRA1,enData.extra1,
                                   USER_NAME,enData.user_name];
            [db beginTransaction];
            res = [db executeUpdate:updateSql];
            if (res)
            {
                NSLog(@"updateOneData成功 %@ %@  %@",TABLE_NAME,enData.user_name,enData.isFriend);
            }
            else
            {
                NSLog(@"updateOneData失败 %@",TABLE_NAME);
            }
            [db commit];
            [db close];
        }
    });
    return res;
}

-(EN_UserModel*)getUserInformationWithUserPhoneName:(NSString*)userphonename{
    __block EN_UserModel *result_block = nil;
    dispatch_sync([QueueFetcher getInstance].dbQueue, ^{
        if ([db open])
        {
            NSString *queryAllSql = [NSString stringWithFormat:@"SELECT * FROM %@", TABLE_NAME];
            FMResultSet *resultSet = [db executeQuery:queryAllSql];
            
            while ([resultSet next])
            {
                EN_UserModel *result = [[EN_UserModel alloc]init];
                result.user_name = [resultSet stringForColumn:USER_NAME];
                result.realname = [resultSet stringForColumn:REALNAME];
                result.headimg = [resultSet stringForColumn:HEADIMG];
                result.duty = [resultSet stringForColumn:DUTY];
                result.socialduty = [resultSet stringForColumn:SOCIALDUTY];
                result.isFriend = [resultSet stringForColumn:ISFRIEND];
                result.extra1 = [resultSet stringForColumn:EXTRA1];
                result_block=result;
            }
            [db close];
        }
    });
    return result_block;
    
}


-(BOOL)isOneDataExist:(NSString*)userphonename
{
    __block BOOL isExist = NO;
    dispatch_sync([QueueFetcher getInstance].dbQueue, ^{
        
        if([db open])
        {
            NSString* sql = [NSString stringWithFormat:@"SELECT COUNT (*) FROM %@ WHERE %@ = '%@'", TABLE_NAME,USER_NAME,userphonename];
            int count = [db intForQuery:sql];
            if(count > 0)
            {
                isExist = YES;
            }
            [db close];
        }
    });
    return isExist;
}



//-(NSMutableArray*)queryData;
@end

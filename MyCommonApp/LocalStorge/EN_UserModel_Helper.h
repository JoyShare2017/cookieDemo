//
//  EN_UserModel_Helper.h
//  JingXinTong
//
//  Created by apple on 2018/7/5.
//  Copyright © 2018年 赵帅. All rights reserved.
//  fmdb数据库EN_UserModel_Helper

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "EN_UserModel.h"
@interface EN_UserModel_Helper : NSObject

-(BOOL)insertOneData:(EN_UserModel*)enData;

+(EN_UserModel_Helper*)getInstance;


-(BOOL)updateOneData:(EN_UserModel*)enData;

-(EN_UserModel*)getUserInformationWithUserPhoneName:(NSString*)userphonename;
-(NSMutableArray*)queryData;
@end

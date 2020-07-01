//
//  CommonRequest.m
//  JingXinTong
//
//  Created by 赵帅 on 2018/5/31.
//  Copyright © 2018年 赵帅. All rights reserved.
//

#import "CommonRequest.h"
#import "NSObject+WLCompress.h"
@implementation CommonRequest
/*
 ** 通用的请求 传过来一个字典（无需userid和username）
 */
+(void)commonRequestWithServerName:(NSString*)serverName
                         andParams:(NSMutableDictionary*)params
                       andComplete:(void(^)(NetworkResult resultCode ,id obj))complete{
    NSString*fullUrl=[NSString stringWithFormat:@"%@%@",ServerRootPath,serverName];
    if ([LoginInfo getInstance].user_id) {
        [params setObject:[LoginInfo getInstance].user_id forKey:@"user_id"];}
    if (!params[@"user_name"]) {
        if ([LoginInfo getInstance].user_name) {
            [params setObject:[LoginInfo getInstance].user_name forKey:@"user_name"];}
    }
    
    KLog(@"请求参数%@---\n %@",serverName,params);
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    [[NetworkManager sharedManager]request:POST URLString:fullUrl parameters:params callback:^(NetworkResult resultCode, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;

        KLog(@"responseObject---\n %@",responseObject);
        if (resultCode==NetworkResultSuceess) {
            complete(resultCode,responseObject);
        }else{
            complete(resultCode,responseObject[@"info"]);
        }
    }];
}
+(void)commonRequestWithImage:(UIImage*)image
                  andComplete:(void(^)(NetworkResult resultCode ,id obj))complete{
    NSString*fullUrl=[NSString stringWithFormat:@"%@index/upload_image",ServerRootPath];
    NSDictionary*dic =@{
                        @"image":@"",
                        };
    
    [[NetworkManager sharedManager]uploadImage:fullUrl parameters:dic imageData:[self scaleImage:image toKb:200] severImageFieldName:@"image" callback:^(NetworkResult resultCode, id responseObject) {
        KLog(@"上传图片结果%@",responseObject);
        if (resultCode==NetworkResultSuceess) {
            complete(resultCode,responseObject);
        }else{
            complete(resultCode,responseObject);
        }
        
    }];
}
/**
 * 注册推送
 **/
+(void)registPushWithCid:(NSString*)cid andComplete:(void(^)(BOOL success ,id obj)) complete{
    if (cid.length*[LoginInfo getInstance].user_name.length>0) {
        NSString*fullUrl=[NSString stringWithFormat:@"%@member/index/get_getui_cid",ServerRootPath];
        NSDictionary*dic =@{@"cid":[LoginInfo getInstance].getuiCid,
                            @"user_id":[LoginInfo getInstance].user_id,
                            @"user_name":[LoginInfo getInstance].user_name,
                            @"phone_type":@"2"
                            };
        
        [[NetworkManager sharedManager]request:POST URLString:fullUrl parameters:dic callback:^(NetworkResult resultCode, id responseObject) {
            if (resultCode==NetworkResultSuceess) {
                complete(YES,@"推送注册成功");
                NSLog(@"推送注册成功");
            }else{
                complete(NO,responseObject[@"msg"]);
                NSLog(@"推送注册失败");
                
            }
        }];
    }else{
        KLog(@"条件不足 停止注册");
    }
    
    
}
@end

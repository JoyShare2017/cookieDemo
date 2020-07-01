//
//  CommonRequest.h
//  JingXinTong
//
//  Created by 赵帅 on 2018/5/31.
//  Copyright © 2018年 赵帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"
@interface CommonRequest : NSObject
/*
 ** 通用的请求 传过来一个字典（无需userid和username）
*/
+(void)commonRequestWithServerName:(NSString*)serverName
                         andParams:(NSMutableDictionary*)params
                   andComplete:(void(^)(NetworkResult resultCode ,id obj))complete;


/*
 ** 通用上传图片 传过来一个uiimage* 一般接口是固定的,如果是不同的接口需要再写
 */
+(void)commonRequestWithImage:(UIImage*)image
                       andComplete:(void(^)(NetworkResult resultCode ,id obj))complete;

/**
 * 注册推送
 **/
+(void)registPushWithCid:(NSString*)cid andComplete:(void(^)(BOOL success ,id obj)) complete;

@end

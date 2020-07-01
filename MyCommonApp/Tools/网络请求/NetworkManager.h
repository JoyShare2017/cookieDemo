//
//  NetworkManager.h
//  Fitness
//
//  Created by apple on 2017/10/11.
//  Copyright © 2017年 北京易魔方. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef enum: NSUInteger{
    GET,
    POST,
} HTTPMethod;

typedef NS_ENUM(NSInteger,NetworkResult)
{
    NetworkResultNODATASUCCESS=-3,
    NetworkResultNotReachable=-2,
    NetworkResultError=-1,
    NetworkResultSuceess=0,
};


typedef void(^NetworkRequestCallback)(NetworkResult resultCode,id responseObject);


@interface NetworkManager : AFHTTPSessionManager


+ (instancetype) sharedManager;
- (BOOL)isNetworkAvailable;


- (void)request:(HTTPMethod)method
      URLString:(NSString *)URLString
     parameters:(id)parameters
       callback:(NetworkRequestCallback)callback;

- (void)uploadImage:(NSString *)URLString
         parameters:(id)parameters
          imageData:(NSData *)imageData
severImageFieldName:(NSString *)name
           callback:(NetworkRequestCallback)callback;

    

@end

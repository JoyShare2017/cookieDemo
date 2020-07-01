//
//  NSObject+KCommonEmptyView.h
//  Finance
//
//  Created by 赵帅 on 2018/4/24.
//  Copyright © 2018年 郝旭珊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KCommonEmptyView)
/**
 *  处理请求空列表 无网络或者无数据
 **/
-(void)showEmptyDataAutoWithView:(UIView*)view  andDataCount:(NSInteger)dateCount andOffset:(NSInteger)offset andReloadEvent:(void(^)(id obj))reloadClick;
-(void)hideCommonEmptyViewWithView:(UIView*)view;

/**
 *  根据网络请求错误码 无网络  无数据  服务器出错
 **/
-(void)showEmptyDataWithErrorCode:(NetworkResult)result andView:(UIView*)view  andDataCount:(NSInteger)dateCount andOffset:(NSInteger)offset andReloadEvent:(void(^)(id obj))reloadClick;
@end

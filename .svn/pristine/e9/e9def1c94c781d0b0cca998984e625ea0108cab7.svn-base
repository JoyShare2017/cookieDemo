//
//  NSData+WLCompress.h
//  CarRepairExpert
//
//  Created by apple on 2018/8/16.
//  Copyright © 2018年 emof. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WLCompress)
/**
 *一般用于上传,直接返回NSData
 **/
-(NSData *)scaleImage:(UIImage *)image toKb:(NSInteger)kb;
/**
 *一般用于展示,返回固定大小,可能会变形
 **/
- (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;
/**
 *一般用于展示,返回固定宽度的图片,长度按比例伸缩
 **/
- (UIImage *)scaleImage:(UIImage *)image toWidth:(CGFloat)width;

@end

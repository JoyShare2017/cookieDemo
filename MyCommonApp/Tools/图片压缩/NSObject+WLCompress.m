//
//  NSData+WLCompress.m
//  CarRepairExpert
//
//  Created by apple on 2018/8/16.
//  Copyright © 2018年 emof. All rights reserved.
//

#import "NSObject+WLCompress.h"

@implementation NSObject (WLCompress)
-(NSData *)scaleImage:(UIImage *)image toKb:(NSInteger)kb{
    
    if (!image) {
        return nil;
    }
    if (kb<1) {
        return nil;
    }
    
    kb*=1024;
    
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > kb && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    NSLog(@"当前大小:%fkb",(float)[imageData length]/1024.0f);
    //    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return imageData;
}

- (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size {
    if (image.size.width > size.width) {
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    } else {
        return image;
    }
}
- (UIImage *)scaleImage:(UIImage *)image toWidth:(CGFloat)width{
    if (image.size.width > width) {
        CGSize size =CGSizeMake(width, width*image.size.height/image.size.width);
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    } else {
        return image;
    }
}

@end

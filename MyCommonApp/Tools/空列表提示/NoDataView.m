//
//  NoDataView.m
//  Finance
//
//  Created by 郝旭珊 on 2018/1/11.
//  Copyright © 2018年 郝旭珊. All rights reserved.
//

#import "NoDataView.h"

@interface NoDataView ()

@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UILabel * label;

@end

@implementation NoDataView

- (void)setImageName:(NSString *)imageName{
    self.imageView.image = [UIImage imageNamed:imageName];
    [self.imageView sizeToFit];
//    self.imageView.centerX = self.centerX;
}

- (void)setLabeText:(NSString *)labeText{
    self.label.text = labeText;
//    self.label.y = self.imageView.maxY + MARGIN_BIG;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


- (void) setup
{
    [self addSubview:self.imageView];
    [self addSubview:self.label];
}

- (UIImageView *) imageView
{
    if(_imageView == nil) {
        UIImage *image = [UIImage imageNamed:@"no_info"];
        CGFloat imgW = 190;
        CGFloat imgH = 198;
        _imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(self.center.x-imgW*0.5,self.frame.size.height*0.5-imgH*0.5-95*0.5, imgW, imgH)];
        _imageView.image = image;
        _imageView.contentMode = UIViewContentModeCenter;

    }
    return _imageView;
}

- (UILabel *) label
{
    if(_label == nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame)+20, self.frame.size.width, 15)];
        _label.font = [UIFont systemFontOfSize:15.0f];
        _label.textColor = [UIColor grayColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = @"暂无相关数据";
    }
    return  _label;
}


@end

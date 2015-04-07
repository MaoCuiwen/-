//
//  CustomNaviButton.m
//  大众点评
//
//  Created by 毛催文 on 15/3/28.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "CustomNaviButton.h"
#import "UIView+Extension.h"

@implementation CustomNaviButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

//自定义button imageView
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imgX = self.width - 20;
    CGFloat imgY = 0;
    CGFloat imgW = 20;
    CGFloat imgH = self.height;
    return CGRectMake(imgX, imgY, imgW, imgH);
}

//自定义button titleLabel
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat imgX = 0;
    CGFloat imgY = 0;
    CGFloat imgW = self.width - 20;
    CGFloat imgH = self.height;
    return CGRectMake(imgX, imgY, imgW, imgH);
}

@end

//
//  CollectionViewCell.m
//  大众点评
//
//  Created by 毛催文 on 15/3/28.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 40, 40)];
        [self addSubview:self.imgV];
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 60, 20)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize:13];
        self.label.textColor = [UIColor blackColor];
        [self addSubview:self.label];
    }
    return self;
}

@end

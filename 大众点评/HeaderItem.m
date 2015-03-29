//
//  HeaderItem.m
//  大众点评
//
//  Created by 毛催文 on 15/3/28.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "HeaderItem.h"

@implementation HeaderItem

+(HeaderItem *)headerItemWithImageName:(NSString *)imageName andItemName:(NSString *)itemName
{
    HeaderItem * header = [[HeaderItem alloc] init];
    header.imageName = imageName;
    header.itemName = itemName;
    return header;
}

@end

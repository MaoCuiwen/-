//
//  HeaderItem.h
//  大众点评
//
//  Created by 毛催文 on 15/3/28.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeaderItem : NSObject

@property(nonatomic,copy)NSString * imageName;
@property(copy,nonatomic)NSString * itemName;
+(HeaderItem*)headerItemWithImageName:(NSString *)imageName andItemName:(NSString *)itemName;

@end

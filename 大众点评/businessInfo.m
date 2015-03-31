//
//  businessInfo.m
//  大众点评
//
//  Created by Elvis's on 15-3-29.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "BusinessInfo.h"

@implementation BusinessInfo
+(instancetype)businessInfoWithName:(NSString *)name andPrice:(NSString *)price andDescrip:(NSString *)descrip andSaleCount:(NSString *)saleCount andImageURL:(NSString *)imageURL andBusinessPath:(NSString *)businessPath{
    BusinessInfo * info = [[BusinessInfo alloc] init];
    info.name = name;
    info.price = price;
    info.descrip = descrip;
    info.saleCount = saleCount;
    info.imageURL = imageURL;
    info.businessPath = businessPath;
    return info;
}
@end

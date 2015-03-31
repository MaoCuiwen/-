//
//  businessInfo.h
//  大众点评
//
//  Created by Elvis's on 15-3-29.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessInfo : NSObject
@property(copy,nonatomic)NSString * name;
@property(copy,nonatomic)NSString * price;
@property(copy,nonatomic)NSString * saleCount;
@property(copy,nonatomic)NSString * descrip;
@property(copy,nonatomic)NSString * imageURL;
@property(copy,nonatomic)NSString * businessPath;
+(instancetype)businessInfoWithName:(NSString *)name andPrice:(NSString *)price andDescrip:(NSString *)descrip andSaleCount:(NSString *)saleCount andImageURL:(NSString *)imageURL andBusinessPath:(NSString *)businessPath;
@end

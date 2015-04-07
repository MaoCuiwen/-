//
//  DianpingApi.h
//  SerlizerURL
//
//  Created by ivan liu on 15-3-28.
//  Copyright (c) 2015年 ivan liu. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^Callback)(id obj);
@interface DianpingApi : NSObject
+(void)requestBussinessesWithCallBack:(Callback)callBack andParams:(NSDictionary *)params;
+(void)requestGroupInfomationWithCallBack:(Callback)callBack andParams:(NSDictionary *)params;
@end

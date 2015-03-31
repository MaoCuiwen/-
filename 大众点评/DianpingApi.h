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
+(void)requestBussinessesWithCallBack:(Callback)callBack;
+(void)requestGroupInfomationWithCallBack:(Callback)callBack;
@end

//
//  DianpingApi.m
//  SerlizerURL
//
//  Created by ivan liu on 15-3-28.
//  Copyright (c) 2015年 ivan liu. All rights reserved.
//
#import "AFNetworking.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "DianpingApi.h"
#import "businessInfo.h"
#define kAPP_KEY @"622195982"
#define kAPP_SECRET @"1a279951329c466b80ce39ed88d34b3b"


@implementation DianpingApi


+(void)requestBussinessesWithCallBack:(Callback)callBack{
    
    NSString *path = @"http://api.dianping.com/v1/business/find_businesses";
    NSDictionary *params = @{@"city": @"北京"};
    path = [DianpingApi serializeURL:path params:params];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        //解析数据
        NSArray * infos = [dic objectForKey:@"businesses"];
        NSMutableArray * arrM = [NSMutableArray array];
        for (NSDictionary * dict in infos) {
            NSString * initialName = [dict objectForKey:@"name"];
            NSString * name = [[initialName componentsSeparatedByString:@"("] firstObject];
            NSNumber * priceN = [dict objectForKey:@"avg_price"];
            NSString * price = [priceN stringValue];
            price = [NSString stringWithFormat:@"%@元",price];
            NSNumber * saleCountN = [dict objectForKey:@"deal_count"];
            NSString * saleCount = [saleCountN stringValue];
            NSString * descrip = [dict objectForKey:@"address"];
            NSString * imageURL = [dict objectForKey:@"s_photo_url"];
            NSString * businessPath = [dict objectForKey:@"business_url"];
            BusinessInfo * info = [BusinessInfo businessInfoWithName:name andPrice:price andDescrip:descrip andSaleCount:saleCount andImageURL:imageURL andBusinessPath:businessPath];
            [arrM addObject:info];
        }
        NSArray * arr = [arrM mutableCopy];
    
        callBack(arr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
    
    [op start];
    
    
    
}
+(void)requestGroupInfomationWithCallBack:(Callback)callBack
{
    NSString * path = @"http://api.dianping.com/v1/deal/find_deals";
    NSDictionary * params = @{@"city":@"北京"};
    path = [DianpingApi serializeURL:path params:params];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * allInfomation = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        //解析数据
        NSArray * infos = [allInfomation objectForKey:@"deals"];
        NSMutableArray * arrM = [NSMutableArray array];
        for (NSDictionary * dict in infos) {
            NSString * name = [dict objectForKey:@"title"];
            NSNumber * priceN = [dict objectForKey:@"current_price"];
            NSString * price = [priceN stringValue];
            price = [NSString stringWithFormat:@"%@元",price];
            NSNumber * saleCountN = [dict objectForKey:@"purchase_count"];
            NSString * saleCount = [saleCountN stringValue];
            NSString * descrip = [dict objectForKey:@"description"];
            NSString * imageURL = [dict objectForKey:@"image_url"];
            NSString * businessPath = [dict objectForKey:@"deal_h5_url"];
            BusinessInfo * info = [BusinessInfo businessInfoWithName:name andPrice:price andDescrip:descrip andSaleCount:saleCount andImageURL:imageURL andBusinessPath:businessPath];
            [arrM addObject:info];
        }
        NSArray * arr = [arrM mutableCopy];
        
        callBack(arr);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
    [operation start];
}
+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params
{
    NSURL* parsedURL = [NSURL URLWithString:[baseURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithDictionary:[self parseQueryString:[parsedURL query]]];
    if (params) {
        [paramsDic setValuesForKeysWithDictionary:params];
    }
    
    NSMutableString *signString = [NSMutableString stringWithString:kAPP_KEY];
    NSMutableString *paramsString = [NSMutableString stringWithFormat:@"appkey=%@", kAPP_KEY];
    NSArray *sortedKeys = [[paramsDic allKeys] sortedArrayUsingSelector: @selector(compare:)];
    for (NSString *key in sortedKeys) {
        [signString appendFormat:@"%@%@", key, [paramsDic objectForKey:key]];
        [paramsString appendFormat:@"&%@=%@", key, [paramsDic objectForKey:key]];
    }
    [signString appendString:kAPP_SECRET];
    unsigned char digest[20];
    NSData *stringBytes = [signString dataUsingEncoding: NSUTF8StringEncoding];
    if (CC_SHA1([stringBytes bytes], [stringBytes length], digest)) {
        /* SHA-1 hash has been calculated and stored in 'digest'. */
        NSMutableString *digestString = [NSMutableString stringWithCapacity:20];
        for (int i=0; i<20; i++) {
            unsigned char aChar = digest[i];
            [digestString appendFormat:@"%02X", aChar];
        }
        [paramsString appendFormat:@"&sign=%@", [digestString uppercaseString]];
        return [NSString stringWithFormat:@"%@://%@%@?%@", [parsedURL scheme], [parsedURL host], [parsedURL path], [paramsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    } else {
        return nil;
    }
}

+ (NSDictionary *)parseQueryString:(NSString *)query {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        
        if ([elements count] <= 1) {
            return nil;
        }
        
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [dict setObject:val forKey:key];
    }
    return dict;
}


@end

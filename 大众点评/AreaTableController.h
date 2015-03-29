//
//  AreaTableController.h
//  大众点评
//
//  Created by 毛催文 on 15/3/28.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableController.h"
@class AreaTableController;

@protocol AreaTableControllerDelegate <NSObject>

-(void)areaTableController:(AreaTableController*)areaTableController didPassData:(NSString *)areaName;

@end

@interface AreaTableController : UITableViewController
@property(nonatomic,weak)id<AreaTableControllerDelegate>delegate;
@end

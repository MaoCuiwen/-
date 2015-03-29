//
//  HomeBusinessCell.h
//  大众点评
//
//  Created by Elvis's on 15-3-29.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "businessInfo.h"

@interface HomeBusinessCell : UITableViewCell
@property(nonatomic,strong)BusinessInfo * businessInfo;
+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

//
//  HomeBusinessCell.m
//  大众点评
//
//  Created by Elvis's on 15-3-29.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "HomeBusinessCell.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface HomeBusinessCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *descriptionL;
@property (weak, nonatomic) IBOutlet UILabel *priceL;
@property (weak, nonatomic) IBOutlet UILabel *saleCountL;

@end

@implementation HomeBusinessCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString * identifier = @"celll";
    HomeBusinessCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeBusinessCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

-(void)setBusinessInfo:(BusinessInfo *)businessInfo
{
    _businessInfo = businessInfo;
    self.priceL.text = _businessInfo.price;
    self.nameL.text = _businessInfo.name;
    self.descriptionL.text = _businessInfo.descrip;
    self.saleCountL.text = _businessInfo.saleCount;
    //根据图片链接地址，使用AFNetworking框架异步下载
    [self.imgV setImageWithURL:[NSURL URLWithString:_businessInfo.imageURL] placeholderImage:[UIImage imageNamed:@"036"]];
    
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

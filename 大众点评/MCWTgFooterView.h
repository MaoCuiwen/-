//
//  MCWTgFooterView.h
//  团购
//
//  Created by Elvis's on 15-2-9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCWTgFooterView;
@protocol MCWTgFooterViewDelegate <NSObject>
-(void)tgFooterViewDidClick:(MCWTgFooterView *)footerView;

@end

@interface MCWTgFooterView : UIView
@property(nonatomic,weak)id<MCWTgFooterViewDelegate>delegate;

@end

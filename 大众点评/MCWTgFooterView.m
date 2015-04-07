//
//  MCWTgFooterView.m
//  团购
//
//  Created by Elvis's on 15-2-9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MCWTgFooterView.h"
@interface MCWTgFooterView ()
@property (weak, nonatomic) IBOutlet UIButton *buttonMore;
@property (weak, nonatomic) IBOutlet UIView *loadView;

@end

@implementation MCWTgFooterView

- (IBAction)click {
    self.buttonMore.hidden = YES;
    self.loadView.hidden =NO;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(tgFooterViewDidClick:)]) {
            [self.delegate tgFooterViewDidClick:self];
        }
        self.buttonMore.hidden = NO;
        self.loadView.hidden = YES;
    });
}




@end

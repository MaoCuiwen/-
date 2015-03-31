//
//  WelcomeViewController.m
//  大众点评
//
//  Created by Elvis's on 15-3-30.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "WelcomeViewController.h"
#import "TabBarBaseController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView * scrollV = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollV.contentSize = CGSizeMake(960, 568);
    scrollV.pagingEnabled = YES;
    scrollV.showsHorizontalScrollIndicator = NO;
    scrollV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollV];
    
    for (int i = 0; i < 3; i++) {
        UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"引导页－%d.jpg",i+1]];
        if (i == 2) {
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(i * self.view.bounds.size.width + 100, 500, 120, 37)];
            [btn addTarget:self action:@selector(jumpToHome) forControlEvents:UIControlEventTouchUpInside];
            [scrollV addSubview:btn];
        }
        [scrollV addSubview:imgV];
    }
}

-(void)jumpToHome
{
    TabBarBaseController * tabBar = [[TabBarBaseController alloc] init];
    [self presentViewController:tabBar animated:YES completion:nil];
}

@end

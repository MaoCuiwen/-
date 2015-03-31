//
//  BaseNavigationController.m
//  大众点评
//
//  Created by 毛催文 on 15/3/28.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "BaseNavigationController.h"
#import "CustomNaviButton.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
[[UIBarButtonItem appearance] setTintColor:[UIColor orangeColor]];
    

}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
   

    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"团购_全部分类_美食_03"] style:UIBarButtonItemStyleDone target:self action:@selector(popBack)];
      
        CustomNaviButton * btn2 = [[CustomNaviButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [btn2 setBackgroundImage:[UIImage imageNamed:@"首页_35"] forState:UIControlStateNormal];
        UIBarButtonItem * barBtn2 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
        viewController.navigationItem.rightBarButtonItem = barBtn2;
        
    } else {
        
    }
   [super pushViewController:viewController animated:animated];
   }

-(void)popBack
{
    [self popViewControllerAnimated:YES];
}

@end

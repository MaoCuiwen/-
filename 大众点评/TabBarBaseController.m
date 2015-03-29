//
//  TabBarBaseController.m
//  大众点评
//
//  Created by 毛催文 on 15/3/28.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "TabBarBaseController.h"
#import "BaseNavigationController.h"
#import "HomeTableController.h"
#import "DiscoverTableController.h"
#import "MineTableController.h"
#import "GroupShopTableController.h"

@interface TabBarBaseController ()

@end

@implementation TabBarBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tabbar整体颜色
    [[UITabBar appearance] setTintColor:[UIColor orangeColor]];
    
    //添加首页
    HomeTableController * home = [[HomeTableController alloc] init];
    [self addOneChildVc:home title:@"首页" image:[UIImage imageNamed:@"设置_16"] selectedImage:[UIImage imageNamed:@"首页_35"]];
    //添加团购
    GroupShopTableController * group = [[GroupShopTableController alloc] init];
    [self addOneChildVc:group title:@"团购" image:[UIImage imageNamed:@"设置_18"] selectedImage:[UIImage imageNamed:@"团购_全部分类_美食_47"]];
    //添加发现
    DiscoverTableController * discover = [[DiscoverTableController alloc] init];
    [self addOneChildVc:discover title:@"发现" image:[UIImage imageNamed:@"首页_03"] selectedImage:[UIImage imageNamed:@"首页_03"]];
    //添加我的
    MineTableController * mine = [[MineTableController alloc] init];
    [self addOneChildVc:mine title:@"我的" image:[UIImage imageNamed:@"首页_32"] selectedImage:[UIImage imageNamed:@"设置_13"]];
}

-(void)addOneChildVc:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    BaseNavigationController * navi = [[BaseNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:navi];
}

@end

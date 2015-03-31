//
//  HomeWebViewController.m
//  大众点评
//
//  Created by Elvis's on 15-3-30.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "HomeWebViewController.h"

@interface HomeWebViewController ()
@property(nonatomic,strong)UIWebView * webView;

@end

@implementation HomeWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL * url = [NSURL URLWithString:self.webPath];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:request];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

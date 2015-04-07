//
//  GroupShopTableController.m
//  大众点评
//
//  Created by 毛催文 on 15/3/28.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "GroupShopTableController.h"
#import "DianpingApi.h"
#import "HomeBusinessCell.h"
#import "HomeWebViewController.h"

@interface GroupShopTableController ()
@property(nonatomic,strong)NSArray * groupInfos;

@end

@implementation GroupShopTableController

-(NSArray *)groupInfos
{
    if (!_groupInfos) {
        NSDictionary * params = @{@"city": @"北京",@"page":@(1),@"platform":@(2)};
        [DianpingApi requestGroupInfomationWithCallBack:^(id obj) {
            _groupInfos = obj;
            [self.tableView reloadData];
        } andParams:params];
    }
    return _groupInfos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 130;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.groupInfos.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"group";
    HomeBusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeBusinessCell" owner:nil options:nil] lastObject];
    }
    BusinessInfo * info = self.groupInfos[indexPath.row];
    cell.businessInfo = info;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BusinessInfo * info = self.groupInfos[indexPath.row];
    NSString * path = info.businessPath;
    HomeWebViewController * webVc = [[HomeWebViewController alloc] init];
    webVc.webPath = path;
    [self.navigationController pushViewController:webVc animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

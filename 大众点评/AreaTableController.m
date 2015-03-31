//
//  AreaTableController.m
//  大众点评
//
//  Created by 毛催文 on 15/3/28.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "AreaTableController.h"

@interface AreaTableController ()

@property(nonatomic,strong)NSDictionary * city;

@end

@implementation AreaTableController

-(NSDictionary *)city
{
    if (!_city) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"region" ofType:@"plist"];
        _city = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return _city;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.city.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray * regions = [self.city allKeys];
    NSString * regionName = regions[section];
    NSArray * districts = [self.city objectForKey:regionName];
    return districts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cell1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"假数据-----%ld",indexPath.row];
    NSArray * regions = [self.city allKeys];
    NSString * regionName = regions[indexPath.section];
    NSArray * districts = [self.city objectForKey:regionName];
    NSString * districtName = districts[indexPath.row];
    cell.textLabel.text = districtName;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([self.delegate respondsToSelector:@selector(areaTableController:didPassData:)]) {
        UITableViewCell * selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        [self.delegate areaTableController:self didPassData:selectedCell.textLabel.text];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray * regions = [self.city allKeys];
    NSString * regionName = regions[section];
    return regionName;
    
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

//
//  HomeTableController.m
//  大众点评
//
//  Created by 毛催文 on 15/3/28.
//  Copyright (c) 2015年 cuihongmao. All rights reserved.
//

#import "HomeTableController.h"
#import "UIView+Extension.h"
#import "UIImage+Extension.h"
#import "headerLayout.h"
#import "CollectionViewCell.h"
#import "HeaderItem.h"
#import "AreaTableController.h"
#import "DianpingApi.h"
#import "HomeBusinessCell.h"
#import "businessInfo.h"

@interface HomeTableController () <UICollectionViewDataSource,UICollectionViewDelegate,AreaTableControllerDelegate>

@property(nonatomic,strong)NSArray * headerDatas;
@property(nonatomic,strong)CustomNaviButton * areaBtn;
@property(nonatomic,strong)NSArray * businessInfos;

@end

@implementation HomeTableController

-(NSArray *)businessInfos
{
    if (!_businessInfos) {
        [DianpingApi requestBussinessesWithCallBack:^(id obj) {
            _businessInfos = obj;
            [self.tableView reloadData];
        }];
    }
    return _businessInfos;
}

-(NSArray *)headerDatas
{
    if (!_headerDatas) {
        HeaderItem * item1 = [HeaderItem headerItemWithImageName:@"首页_11" andItemName:@"美食"];
        HeaderItem * item2 = [HeaderItem headerItemWithImageName:@"首页_12" andItemName:@"电影"];
        HeaderItem * item3 = [HeaderItem headerItemWithImageName:@"首页_13" andItemName:@"酒店"];
        HeaderItem * item4 = [HeaderItem headerItemWithImageName:@"首页_14" andItemName:@"KTV"];
        HeaderItem * item5 = [HeaderItem headerItemWithImageName:@"首页_15" andItemName:@"小吃"];
        HeaderItem * item6 = [HeaderItem headerItemWithImageName:@"首页_16" andItemName:@"休闲娱乐"];
        HeaderItem * item7 = [HeaderItem headerItemWithImageName:@"首页_17" andItemName:@"今日新品"];
        HeaderItem * item8 = [HeaderItem headerItemWithImageName:@"首页_18" andItemName:@"更多"];
        _headerDatas = @[item1,item2,item3,item4,item5,item6,item7,item8];
    }
    return _headerDatas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 129;
    // 设置导航栏左侧按钮
    CustomNaviButton * leftItem = [[CustomNaviButton alloc] init];
    [leftItem setTitle:@"北京" forState:UIControlStateNormal];
    [leftItem setImage:[UIImage imageNamed:@"首页_06"] forState:UIControlStateNormal];
    leftItem.size = CGSizeMake(50, 30);
    [leftItem addTarget:self action:@selector(showArea:) forControlEvents:UIControlEventTouchUpInside];
    self.areaBtn = leftItem;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.areaBtn];
    
    //设置导航栏中间的搜索框，自定义
    UITextField * searchField = [[UITextField alloc] init];
    searchField.size = CGSizeMake(200, 30);
    searchField.borderStyle = UITextBorderStyleRoundedRect;
    searchField.backgroundColor = [UIColor redColor];
    UIImageView * imgV = [[UIImageView alloc] init];
    imgV.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
    imgV.width = imgV.image.size.width + 5;
    imgV.height = imgV.image.size.height;
    imgV.contentMode = UIViewContentModeRight;
    searchField.leftView = imgV;
    searchField.leftViewMode = UITextFieldViewModeAlways;
    searchField.clearButtonMode = UITextFieldViewModeAlways;
    searchField.placeholder = @"输入商户名、地点";
    searchField.font = [UIFont systemFontOfSize:13];
    self.navigationItem.titleView = searchField;
    
    //自定义tableview headerview
    headerLayout * layout = [[headerLayout alloc] init];
    UICollectionView * header = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 150) collectionViewLayout:layout];
    header.delegate = self;
    header.dataSource = self;
    header.backgroundColor = [UIColor whiteColor];
    [header registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"headercell"];
    self.tableView.tableHeaderView = header;
    
    
    
}

-(void)showArea:(CustomNaviButton *)btn
{

    AreaTableController * area = [[AreaTableController alloc] init];
    area.delegate = self;
    [self.navigationController presentViewController:area animated:YES completion:nil];
}

#pragma mark - AreaTableControllerDelegate

-(void)areaTableController:(AreaTableController *)areaTableController didPassData:(NSString *)areaName
{
    [self.areaBtn setTitle:areaName forState:UIControlStateNormal];
}


#pragma mark - Collection view data source

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.headerDatas.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headercell" forIndexPath:indexPath];
    HeaderItem * item = self.headerDatas[indexPath.row];
    cell.imgV.image = [UIImage imageNamed:item.imageName];
    cell.label.text = item.itemName;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"-----------------%ld--------",indexPath.row);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.businessInfos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeBusinessCell * cell = [HomeBusinessCell cellWithTableView:tableView];
    BusinessInfo * busiInfo = self.businessInfos[indexPath.row];
    
    cell.businessInfo = busiInfo;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"%ld" , (long)indexPath.row);
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"猜你喜欢";
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

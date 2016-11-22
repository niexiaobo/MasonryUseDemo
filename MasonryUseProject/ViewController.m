//
//  ViewController.m
//  MasonryUseProject
//
//  Created by niexiaobo on 2016/11/22.
//  Copyright © 2016年 niexiaobo. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "Cell1ViewController.h"
#import "Cell2ViewController.h"
#import "Cell3ViewController.h"
#import "Cell4ViewController.h"
#import "Cell5ViewController.h"
#import "Cell6ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView  *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self initViewConstraints];
}

#pragma mark -- UI
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        
    }
    return _tableView;
}

- (void)initViewConstraints {
    __weak typeof(self) weakSelf = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(weakSelf.view);
        make.top.mas_equalTo(100);
        
    }];
}

#pragma mark  UITableViewDataSource UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"UITableViewCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }

    NSArray *titleArray = @[@"上下左右空 间隔设置 >",@"Priority 简单的动画 >",@"相互约束 >",@"更新 约束mas_updateConstraints >",@"重写 约束 mas_remakeConstraints >",@"比例使用 multipliedBy >"];
    cell.textLabel.text = titleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        Cell1ViewController *VC = [[Cell1ViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    } else if (indexPath.row == 1){
        Cell2ViewController *VC = [[Cell2ViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    
    } else if (indexPath.row == 2){
        Cell3ViewController *VC = [[Cell3ViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
        
    } else if (indexPath.row == 3){
        Cell4ViewController *VC = [[Cell4ViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
        
    } else if (indexPath.row == 4){
        Cell5ViewController *VC = [[Cell5ViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
        
    } else if (indexPath.row == 5){
        Cell6ViewController *VC = [[Cell6ViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
        
    }
    
}



@end

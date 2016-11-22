//
//  Cell1ViewController.m
//  MasonryUseProject
//
//  Created by niexiaobo on 2016/11/22.
//  Copyright © 2016年 niexiaobo. All rights reserved.
//

#import "Cell1ViewController.h"
#import "Masonry.h"
@interface Cell1ViewController ()
@property(nonatomic,strong)UIView *view1;
@end

@implementation Cell1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view1 = [[UIView alloc]init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.view1];
    
    [self testA2];
    
}

- (void)testA2 {
    //对象是父视图,下面展示四种不同写法
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@150); 建议用mas_equalTo
        make.top.mas_equalTo(150); //不添加对象，默认父视图
        
        make.left.equalTo(self.view.mas_left); //不设置默认0
        make.bottom.mas_equalTo(-230); //小于0,向上
        make.right.equalTo(self.view.mas_right).with.offset(-100);
    }];
}

//用内间距方式
- (void)testB {
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(150, 30, 30, 30)); //底部设置大于0
    }];
}

@end

//
//  Cell2ViewController.m
//  MasonryUseProject
//
//  Created by niexiaobo on 2016/11/22.
//  Copyright © 2016年 niexiaobo. All rights reserved.
//

#import "Cell2ViewController.h"
#import "Masonry.h"

@interface Cell2ViewController ()
@property(nonatomic,strong)UIView *blueView;
@end

@implementation Cell2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"点击屏幕移除蓝色View";
    
    // 红色View
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    // 蓝色View
    self.blueView = [[UIView alloc]init];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    // 黄色View
    UIView *yellowView = [[UIView alloc]init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    // ---红色View--- 添加约束
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
    // ---蓝色View--- 添加约束
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(redView.mas_right).with.offset(40);
        make.bottom.width.height.mas_equalTo(redView);
    }];
    
    // ---黄色View--- 添加约束
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.blueView.mas_right).with.offset(40);
        make.right.mas_equalTo(self.view.mas_right).with.offset(-20);
        make.bottom.width.height.mas_equalTo(redView);
        
        // 优先级设置为250，最高1000（默认）
        make.left.mas_equalTo(redView.mas_right).with.offset(20).priority(250);
    }];
    
}

// 点击屏幕移除蓝色View
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.blueView removeFromSuperview];
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end

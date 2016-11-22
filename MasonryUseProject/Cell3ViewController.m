//
//  Cell3ViewController.m
//  MasonryUseProject
//
//  Created by niexiaobo on 2016/11/22.
//  Copyright © 2016年 niexiaobo. All rights reserved.
//

#import "Cell3ViewController.h"
#import "Masonry.h"
@interface Cell3ViewController ()

@end

@implementation Cell3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"相互约束";
    
    int padding = 15;
    
    //command + 左右键 
    
    UIView *greenView = [[UIView alloc]init];
    [self.view addSubview:greenView];
    greenView.backgroundColor = [UIColor greenColor];
    
    UIView *redView = [[UIView alloc]init];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    
    UIView *blueView = [[UIView alloc]init];
    [self.view addSubview:blueView];
    blueView.backgroundColor = [UIColor blueColor];
    
    // 对 绿色View 进行约束
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(padding); // X
        
        make.top.mas_equalTo(80); // Y
        make.bottom.mas_equalTo(blueView.mas_top).with.offset(-padding);// Y --> 推断出 Height
        
        make.width.mas_equalTo(redView); // Width == 红色View（它推断出Width）
    }];
    
    // 对 红色View 进行约束
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(greenView.mas_right).with.offset(padding); // X
        make.right.mas_equalTo(-padding);// X --> 推断出 Width
        
        make.bottom.and.height.mas_equalTo(greenView); // Y & Height == 绿色View（它推断出 Height&Y）
    }];
    
    // 对 蓝色View 进行约束
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(padding); // X
        make.right.mas_equalTo(-padding); // X --> 推断出 Width
        
        make.bottom.mas_equalTo(-padding); // Y
        
        make.height.mas_equalTo(greenView); // 注意1：Height == 绿色View（它推断出Height）
    }];
}

@end

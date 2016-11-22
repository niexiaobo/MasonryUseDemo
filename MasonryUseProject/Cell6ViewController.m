//
//  Cell6ViewController.m
//  MasonryUseProject
//
//  Created by niexiaobo on 2016/11/22.
//  Copyright © 2016年 niexiaobo. All rights reserved.
//

#import "Cell6ViewController.h"
#import "Masonry.h"
@interface Cell6ViewController ()

@end

@implementation Cell6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"比例使用";
    
    UIView *topView = [[UIView alloc]init];
    [topView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:topView];
    
    UIView *topInnerView = [[UIView alloc]init];
    [topInnerView setBackgroundColor:[UIColor greenColor]];
    [topView addSubview:topInnerView];
    
    UIView *bottomView = [[UIView alloc]init];
    [bottomView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:bottomView];
    
    UIView *bottomInnerView = [[UIView alloc]init];
    [bottomInnerView setBackgroundColor:[UIColor blueColor]];
    [bottomView addSubview:bottomInnerView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(70);
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        
        make.height.mas_equalTo(bottomView);
    }];
    
    [topInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //1、我们设置了其top和bottom与父视图一致且始终在父视图中居中显示：
        make.left.right.mas_equalTo(topView);
        make.center.mas_equalTo(topView);
        
        //2、最后，我们设置了bottomInnerView的高为宽的3倍
        make.width.mas_equalTo(topInnerView.mas_height).multipliedBy(3);
        
        //3、 然后我们通过make.width.height.lessThanOrEqualTo设置了宽、高的最大值与父视图相同，然后设置了宽和高与父视图相等，但是优先级为最低，以保证子视图的宽高不超过父视图。
        make.width.height.mas_equalTo(topView).priorityLow();
        make.width.height.lessThanOrEqualTo(topView);
        
        
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(topView);
        make.top.mas_equalTo(topView.mas_bottom);
    }];
    
    [bottomInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(bottomView);
        make.height.mas_equalTo(bottomInnerView.mas_width).multipliedBy(3);
        make.center.mas_equalTo(bottomView);
    }];
}

@end

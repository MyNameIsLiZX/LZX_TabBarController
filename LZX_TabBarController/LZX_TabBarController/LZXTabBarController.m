//
//  LZXTabBarController.m
//  LZX_TabBarController
//
//  Created by twzs on 2017/6/6.
//  Copyright © 2017年 LZX. All rights reserved.
//

#import "LZXTabBarController.h"

#import "ViewController.h"

#import "LZXTabBar.h"

@interface LZXTabBarController ()

@end

@implementation LZXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LZXTabBar *tabbar = [LZXTabBar new];
    // 是否裁剪
    tabbar.isCut = YES;
    // 中间按钮默认背景
    tabbar.image_name = @"zxy_icon";
    // 中间按钮高亮背景
    tabbar.hightImage_name = @"zxy_icon";
    // 中心Y轴向上移动多少像素
    tabbar.centerY = 20;
    // 点击事件
    tabbar.centerViewClickBlock = ^{
        NSLog(@"点击了中间按钮");
    };
    [self setValue:tabbar forKey:@"tabBar"];
    
    
    ViewController *vc = [ViewController new];
    
    vc.tabBarItem.title = @"首页";
    
    [self addChildViewController:vc];
    
    ViewController *vc1 = [ViewController new];
    
    vc1.tabBarItem.title = @"资讯";
    
    [self addChildViewController:vc1];
    
    ViewController *vc2 = [ViewController new];
    
    vc2.tabBarItem.title = @"更多";
    
    [self addChildViewController:vc2];
    
    ViewController *vc3 = [ViewController new];
    
    vc3.tabBarItem.title = @"我的";
    
    [self addChildViewController:vc3];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

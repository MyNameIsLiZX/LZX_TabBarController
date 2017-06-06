//
//  LZXTabBar.m
//  LZX_TabBarController
//
//  Created by twzs on 2017/6/6.
//  Copyright © 2017年 LZX. All rights reserved.
//


#import "LZXTabBar.h"

@interface LZXTabBar ()

@property (nonatomic, strong) UIButton  *centerBtn;

@end

@implementation LZXTabBar


- (UIButton *)centerBtn {
    if (!_centerBtn) {
        UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [centerBtn setBackgroundImage:[UIImage imageNamed:self.image_name] forState:UIControlStateNormal];
        [centerBtn setBackgroundImage:[UIImage imageNamed:self.hightImage_name] forState:UIControlStateHighlighted];
        [centerBtn addTarget:self action:@selector(centerBtnClickEvent) forControlEvents:UIControlEventTouchUpInside];
        // 按钮根据内容自适应
        [centerBtn sizeToFit];
        _centerBtn = centerBtn;
        [self addSubview:centerBtn];
    }
    return _centerBtn;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    // 去掉边缘的黑线
    self.barStyle = UIBarStyleBlack;
        
    // 设置背景图片
    self.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSInteger count = self.items.count + 1;
    
    CGFloat btnW = self.frame.size.width / count;
    CGFloat btnH = self.frame.size.height;
    
    CGFloat btnX = 0;
    
    NSInteger i = 0;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i += 1;
            }
            
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, 0, btnW, btnH);
            
            i++;
        }
    }
    self.centerBtn.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5 - self.centerY);
    
    if (self.isCut) {
        self.centerBtn.layer.cornerRadius = self.centerBtn.bounds.size.width/2;
        self.centerBtn.layer.masksToBounds = YES;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    // 转换点击在tabbar上的坐标点,到中间按钮上
    CGPoint pointInMiddleBtn = [self convertPoint:point toView:self.centerBtn];
    //  确定中间按钮的圆心
    CGPoint middleBtnCenter = CGPointMake(self.centerBtn.bounds.size.width/2, self.centerBtn.bounds.size.height/2);
    // 计算点击的位置距离圆心的距离
    CGFloat distance = sqrt(pow(pointInMiddleBtn.x - middleBtnCenter.x, 2) + pow(pointInMiddleBtn.y - middleBtnCenter.y, 2));
    // 判断中间按钮区域之外
    if (distance > self.centerBtn.bounds.size.width && pointInMiddleBtn.y < self.centerY) {
        return NO;
    }
    
    return YES;
}

- (void)centerBtnClickEvent {
    if (self.centerViewClickBlock) {
        self.centerViewClickBlock();
    }
}


@end

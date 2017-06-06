//
//  LZXTabBar.h
//  LZX_TabBarController
//
//  Created by twzs on 2017/6/6.
//  Copyright © 2017年 LZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZXTabBar : UITabBar

/** 默认背景图片 */
@property (nonatomic, strong) NSString  *image_name;
/** 高亮背景图片 */
@property (nonatomic, strong) NSString  *hightImage_name;
/** 向上偏移多少像素 */
@property (nonatomic, assign) NSInteger  centerY;
/** 点击中间按钮, 执行的代码块 */
@property (nonatomic, copy) void(^centerViewClickBlock)();
/** 是否裁剪圆形 */
@property (nonatomic, assign) BOOL  isCut;
@end

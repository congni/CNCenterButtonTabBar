//
//  CNTabBarDataSource.h
//  LuaViewTestProject
//
//  Created by 余彪 on 16/5/25.
//  Copyright © 2016年 quanXiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNTabBarButtonDataSourceModel.h"


@interface CNTabBarDataSource : NSObject

// 背景图片
@property (nonatomic, copy) UIImage *backgroundImage;
// 是否支持中央按钮
@property (nonatomic, assign) BOOL isSupportCenterButton;
// 正常状态的中央按钮图片
@property (nonatomic, copy) UIImage *normalCenterButtonImage;
// 选中状态的中央按钮图片
@property (nonatomic, copy) UIImage *selectedCenterButtonImage;
// 中央按钮对应VC
@property (nonatomic, strong) UIViewController *viewController;
// 中央按钮的四周间距(默认是居中)
@property (nonatomic, assign) float space;
// 这个是背景图片，中央按钮部分的大小，并不是点击区域的按钮大小，用于中央按钮两边的按钮位置对齐
@property (nonatomic, assign) float centerButtonSize;

// 高度
@property (nonatomic, assign) float tabBarHeight;
// 实际矩形高度(注：一般情况下实际矩形高度和tabBarHeight是一样，但是如果是有中央按钮的话，实际矩形高度，就要去除中央按钮凸出那一部分，主要用于其他按钮上线间距调整)
@property (nonatomic, assign) float rectangleHeight;

// 按钮数组
@property (nonatomic, copy) NSArray<CNTabBarButtonDataSourceModel *> *tabBarButtons;

@end

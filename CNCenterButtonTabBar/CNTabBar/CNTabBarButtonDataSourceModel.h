//
//  CNTabBarButtonDataSourceModel.h
//  LuaViewTestProject
//
//  CNTabBar文字数据源
//
//  Created by 余彪 on 16/5/25.
//  Copyright © 2016年 quanXiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CNTabBarButtonDataSourceModel : NSObject

// 是否有文字
@property (nonatomic, assign) BOOL isHaveTitleText;
// 正常状态的图片
@property (nonatomic, copy) UIImage *normalImage;
// 选中状态的图片
@property (nonatomic, copy) UIImage *selectedImage;
// 文字
@property (nonatomic, copy) NSString *titleString;
// 正常状态的字体
@property (nonatomic, copy) UIFont *normalTitleFont;
// 选中状态的字体
@property (nonatomic, copy) UIFont *selectedTitleFont;
// 正常状态的文字颜色
@property (nonatomic, copy) UIColor *normalTitleColor;
// 选中状态的文字颜色
@property (nonatomic, copy) UIColor *selectedTitleColor;
// 文字与图片之间距离(默认为3.0)
@property (nonatomic, assign) float spaceImageWithTitle;
// 是否支持新消息
@property (nonatomic, assign) BOOL isSupportNewsDot;
// 是否有新消息(默认是NO)
@property (nonatomic, assign) BOOL isHaveNewsDot;
// 是否支持角标
@property (nonatomic, assign) BOOL isSupportCorner;
// 是否角标数值为0时，是否隐藏
@property (nonatomic, assign) BOOL isCornerZeroHidden;
// 设置角标数值
@property (nonatomic, assign) int cornerValue;

// 当前是否选中(默认为NO)
@property (nonatomic, assign) BOOL isSelected;
// 对应的VC
@property (nonatomic, strong) UIViewController *viewController;

//TODO: 以下几个属性，暂时先占位，以后在做相关设置，现在设置默认值
// 新消息UI颜色
@property (nonatomic, copy) UIColor *newsDotColor;
// 新消息UI大小
@property (nonatomic, assign) CGSize newsDotSize;
// 角标文字颜色
@property (nonatomic, copy) UIColor *cornerTitleColor;
// 角标背景颜色
@property (nonatomic, copy) UIColor *cornerBackgroundColor;
// 角标数字字体
@property (nonatomic, copy) UIFont *cornerFont;

@end

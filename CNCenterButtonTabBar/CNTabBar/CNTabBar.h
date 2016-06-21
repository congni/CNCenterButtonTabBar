//
//  CNTabBar.h
//  LuaViewTestProject
//
//  Created by 余彪 on 16/5/25.
//  Copyright © 2016年 quanXiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNTabBarDataSource.h"


@class CNTabBarButton;
// 回调协议
@protocol CNTabBarDelegate <NSObject>

/**
 *  按钮点击回调
 *
 *  @param tabBarButton CNTabBarButton
 */
- (void)tabBarButtonClick:(CNTabBarButton *)tabBarButton;

@optional
/**
 *  中央按钮点击回调
 */
- (void)tabBarCenterButtonClick;

@end


@interface CNTabBar : UIView {
    // 容器
    UIView *_tabBarView;
    // 中央按钮
    UIButton *_centerButton;
    // 最后选择的button
    CNTabBarButton *_lastTabBarButton;
    // 按钮容器
    NSMutableArray *_tabBarButtons;
}

// 数据源
@property (nonatomic, copy) CNTabBarDataSource *dataSourceModel;
// 回调代理
@property (nonatomic, weak) id<CNTabBarDelegate> delegate;

/**
 *  设置选中按钮
 *
 *  @param index 按钮index
 */
- (void)selectedAtIndex:(NSInteger)index;

/**
 *  设置选中中央按钮
 */
- (void)selectCenterButton;

/**
 *  更新按钮数据(一般用于更新角标数字、新消息Dot显示)
 *
 *  @param dataSourceModel 数据源
 *  @param index           按钮Index
 */
- (void)updateDataSource:(CNTabBarButtonDataSourceModel *)dataSourceModel atIndex:(NSInteger)index;

@end

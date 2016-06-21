//
//  CNTabBarViewController.h
//  LuaViewTestProject
//
//  Created by 余彪 on 16/5/25.
//  Copyright © 2016年 quanXiang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CNTabBarDataSource, CNTabBar, CNTabBarButtonDataSourceModel;
@protocol CNTabBarViewControllerDelegate <NSObject>

- (void)selectedTabBarButton:(CNTabBarButtonDataSourceModel *)dataSourceModel;

@optional
- (void)centerButtonSelected;

@end


@interface CNTabBarViewController : UIViewController

// 数据源
@property (nonatomic, strong) CNTabBarDataSource *tabBarDataSourceModel;
// 底部TabBar组件
@property (nonatomic, strong) CNTabBar *tabBar;
// 回调代理
@property (nonatomic, weak) id<CNTabBarViewControllerDelegate> delegate;

@end

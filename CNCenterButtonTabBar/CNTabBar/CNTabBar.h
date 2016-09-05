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

/**
 *  角标设置(注意： 1、显示的话，对应位置上的dataSource必须支持显示角标，否则就算设置yes，也不会显示； 2、如果是要在现有角标数据上减一个数值，则直接传一个负值即可，如：现在角标数值是10，你需要其减1，则直接传-1即可；3、如果是需要递增，则调用cornerValueIncreasing方法)
 *
 *  @param value 角标数值
 *  @param index 对应的位置
 */
- (void)cornerValue:(int)value atIndex:(NSInteger)index;

/**
 *  角标设置，递增值(注意： 1、显示的话，对应位置上的dataSource必须支持显示角标，否则就算设置yes，也不会显示； 2、此方法为在现有角标数值的基础上增加一个数值，如：现在角标数值是10，你需要在其基础上加2，则调用此方法; 3、如果设置的数值小于0则不执行操作)
 *
 *  @param value 递增值
 *  @param index 对应的位置
 */
- (void)cornerValueIncreasing:(NSInteger)value atIndex:(NSInteger)index;

/**
 *  新消息红点(注意： 显示的话，对应位置上的dataSource必须支持显示红点，否则就算设置yes，也不会显示)
 *
 *  @param isShow 是否显示，YES为显示，NO为不显示
 *  @param index  对应的文职
 */
- (void)isNewDotShow:(BOOL)isShow atIndex:(NSInteger)index;

@end

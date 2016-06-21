//
//  CNTabBarViewController.m
//  LuaViewTestProject
//
//  Created by 汪君 on 16/5/25.
//  Copyright © 2016年 quanXiang. All rights reserved.
//

#import "CNTabBarViewController.h"
#import "CNTabBar.h"
#import "CNTabBarButton.h"

@interface CNTabBarViewController ()<CNTabBarDelegate>
@property (nonatomic, strong) UIView *contentView;
@end

@implementation CNTabBarViewController
@synthesize tabBarDataSourceModel = _tabBarDataSourceModel;


#pragma mark -- LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- Private Method
- (void)createTabBar {
    if (!self.tabBar) {
        self.tabBar = [[CNTabBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - self.tabBarDataSourceModel.tabBarHeight, self.view.frame.size.width, self.tabBarDataSourceModel.tabBarHeight)];
        self.tabBar.dataSourceModel = self.tabBarDataSourceModel;
        self.tabBar.delegate = self;
        
        float height = self.view.frame.size.height - self.tabBarDataSourceModel.tabBarHeight + (self.tabBarDataSourceModel.tabBarHeight - self.tabBarDataSourceModel.rectangleHeight);
        CGRect contentRect = CGRectMake(0, 0, self.view.frame.size.width, height);
        self.contentView = [[UIView alloc] initWithFrame:contentRect];
        
        [self.view addSubview:self.contentView];
        [self.view addSubview:self.tabBar];
    }
}

#pragma mark 删除最下面View
- (void)removeLastView {
    if (self.contentView.subviews.count > 1) {
        UIView *lastView = self.contentView.subviews[0];
        [lastView removeFromSuperview];
    }
}

#pragma mark -- CNTabBar Delegate
#pragma mark 按钮点击
-(void)tabBarButtonClick:(CNTabBarButton *)tabBarButton {
    [self addChildViewController:tabBarButton.dataSourceModel.viewController];
    tabBarButton.dataSourceModel.viewController.view.frame = self.contentView.bounds;
    [self.contentView addSubview:tabBarButton.dataSourceModel.viewController.view];
    
    [self removeLastView];
    
    if ([self.delegate respondsToSelector:@selector(selectedTabBarButton:)]) {
        [self.delegate selectedTabBarButton:tabBarButton.dataSourceModel];
    }
}

#pragma mark 中央按钮点击
- (void)tabBarCenterButtonClick {
    [self addChildViewController:self.tabBar.dataSourceModel.viewController];
    self.tabBar.dataSourceModel.viewController.view.frame = self.contentView.bounds;
    [self.contentView addSubview:self.tabBar.dataSourceModel.viewController.view];
    
    [self removeLastView];
    
    if ([self.delegate respondsToSelector:@selector(centerButtonSelected)]) {
        [self.delegate centerButtonSelected];
    }
}

#pragma mark -- DataSourceModel GET/SETER
#pragma mark GET
- (CNTabBarDataSource *)tabBarDataSourceModel {
    return _tabBarDataSourceModel;
}

#pragma mark SET
-(void)setTabBarDataSourceModel:(CNTabBarDataSource *)tabBarDataSourceModel {
    _tabBarDataSourceModel = tabBarDataSourceModel;
    
    [self createTabBar];
}

@end

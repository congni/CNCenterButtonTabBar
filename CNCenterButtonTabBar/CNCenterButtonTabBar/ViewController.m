//
//  ViewController.m
//  CNCenterButtonTabBar
//
//  Created by 葱泥 on 16/6/21.
//  Copyright © 2016年 quanXiang. All rights reserved.
//

#import "ViewController.h"
#import "CNTabBar.h"
#import "CNTabBarButtonDataSourceModel.h"
#import "CNTabBarDataSource.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"
#import "ZViewController.h"
#import "CNTabBarViewController.h"

@interface ViewController ()<CNTabBarViewControllerDelegate> {
    CNTabBarButtonDataSourceModel *_chatModel;
    CNTabBarButtonDataSourceModel *_dynamicModel;
    CNTabBarViewController *_tabBarViewController;
}

@end

@implementation ViewController


#pragma mark -- LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CNTabBarDataSource *tabBarDataSourceModel = [self tabBarDataSource];
    
    _tabBarViewController = [[CNTabBarViewController alloc] init];
    _tabBarViewController.tabBarDataSourceModel = tabBarDataSourceModel;
    _tabBarViewController.delegate = self;
    [self addChildViewController:_tabBarViewController];
    [self.view addSubview:_tabBarViewController.view];
    
    
    [_tabBarViewController.tabBar selectCenterButton];
}

#pragma mark -- CNTabBarViewControllerDelegate
- (void)selectedTabBarButton:(CNTabBarButtonDataSourceModel *)dataSourceModel {
    _dynamicModel.isHaveNewsDot = NO;
    [_tabBarViewController.tabBar updateDataSource:_dynamicModel atIndex:2];
    
    _chatModel.cornerValue--;
    [_tabBarViewController.tabBar updateDataSource:_chatModel atIndex:1];
}

- (void)centerButtonSelected {
    _chatModel.cornerValue++;
    [_tabBarViewController.tabBar updateDataSource:_chatModel atIndex:1];
    
    _dynamicModel.isHaveNewsDot = YES;
    [_tabBarViewController.tabBar updateDataSource:_dynamicModel atIndex:2];
}


#pragma mark -- Private Method
- (CNTabBarDataSource *)tabBarDataSource {
    CNTabBarDataSource *tabBarDataSourceModel = [[CNTabBarDataSource alloc] init];
    
    CNTabBarButtonDataSourceModel *notificationModel = [[CNTabBarButtonDataSourceModel alloc] init];
    notificationModel.normalImage = [UIImage imageNamed:@"inform"];
    notificationModel.selectedImage = [UIImage imageNamed:@"inform-on"];
    notificationModel.titleString = @"通知";
    notificationModel.normalTitleColor = [UIColor blackColor];
    notificationModel.selectedTitleColor = [UIColor blueColor];
    notificationModel.spaceImageWithTitle = 3.0;
    notificationModel.normalTitleFont = [UIFont systemFontOfSize:10.0];
    notificationModel.viewController = [[AViewController alloc] init];
    
    _chatModel = [[CNTabBarButtonDataSourceModel alloc] init];
    _chatModel.normalImage = [UIImage imageNamed:@"chat"];
    _chatModel.selectedImage = [UIImage imageNamed:@"chat-on"];
    _chatModel.titleString = @"聊天";
    _chatModel.normalTitleColor = [UIColor blackColor];
    _chatModel.selectedTitleColor = [UIColor blueColor];
    _chatModel.spaceImageWithTitle = 3.0;
    _chatModel.normalTitleFont = [UIFont systemFontOfSize:10.0];
    _chatModel.isSupportCorner = YES;
    _chatModel.cornerValue = 10;
    _chatModel.viewController = [[BViewController alloc] init];
    
    _dynamicModel = [[CNTabBarButtonDataSourceModel alloc] init];
    _dynamicModel.normalImage = [UIImage imageNamed:@"Share"];
    _dynamicModel.selectedImage = [UIImage imageNamed:@"Share-on"];
    _dynamicModel.titleString = @"动态";
    _dynamicModel.normalTitleColor = [UIColor blackColor];
    _dynamicModel.selectedTitleColor = [UIColor blueColor];
    _dynamicModel.spaceImageWithTitle = 3.0;
    _dynamicModel.normalTitleFont = [UIFont systemFontOfSize:10.0];
    _dynamicModel.isSupportNewsDot = YES;
    _dynamicModel.isHaveNewsDot = YES;
    _dynamicModel.viewController = [[CViewController alloc] init];
    
    CNTabBarButtonDataSourceModel *mineModel = [[CNTabBarButtonDataSourceModel alloc] init];
    mineModel.normalImage = [UIImage imageNamed:@"user"];
    mineModel.selectedImage = [UIImage imageNamed:@"user-on"];
    mineModel.titleString = @"我的";
    mineModel.normalTitleColor = [UIColor blackColor];
    mineModel.selectedTitleColor = [UIColor blueColor];
    mineModel.spaceImageWithTitle = 3.0;
    mineModel.normalTitleFont = [UIFont systemFontOfSize:10.0];
    mineModel.viewController = [[DViewController alloc] init];
    
    NSArray *tabBarButtons = @[notificationModel, _chatModel, _dynamicModel, mineModel];
    
    tabBarDataSourceModel.tabBarButtons = tabBarButtons;
    tabBarDataSourceModel.backgroundImage = [UIImage imageNamed:@"Barbg"];
    tabBarDataSourceModel.isSupportCenterButton = YES;
    tabBarDataSourceModel.normalCenterButtonImage = [UIImage imageNamed:@"1"];
    tabBarDataSourceModel.selectedCenterButtonImage = [UIImage imageNamed:@"2"];
    tabBarDataSourceModel.space = -2.0;
    tabBarDataSourceModel.centerButtonSize = 69.0;
    tabBarDataSourceModel.tabBarHeight = 69.0;
    tabBarDataSourceModel.rectangleHeight = 49.0;
    tabBarDataSourceModel.viewController = [[ZViewController alloc] init];
    
    return tabBarDataSourceModel;
}


@end

//
//  CNTabBar.m
//  LuaViewTestProject
//
//  Created by 余彪 on 16/5/25.
//  Copyright © 2016年 quanXiang. All rights reserved.
//

#import "CNTabBar.h"
#import "CNTabBarButton.h"
#import "CNTabBarButtonDataSourceModel.h"


@implementation CNTabBar
@synthesize dataSourceModel = _dataSourceModel;

#pragma mark -- Public Method
#pragma mark 选中
- (void)selectedAtIndex:(NSInteger)index {
    if (index < _tabBarButtons.count) {
        CNTabBarButton *tabBarButton = _tabBarButtons[index];
        [self tabBarButtonClick:tabBarButton];
    }
}

#pragma mark 中央按钮点击
- (void)selectCenterButton {
    if (self.dataSourceModel.isSupportCenterButton) {
        [self centerButtonClick];
    }
}

#pragma mark 用于外部更改按钮状态
- (void)updateDataSource:(CNTabBarButtonDataSourceModel *)dataSourceModel atIndex:(NSInteger)index {
    if (index < _tabBarButtons.count) {
        CNTabBarButton *tabBarButton = _tabBarButtons[index];
        tabBarButton.dataSourceModel = dataSourceModel;
    }
}

#pragma mark -- Private Method
#pragma mark 创建UI
- (void)setupUI {
    _tabBarView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:_tabBarView];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:self.dataSourceModel.backgroundImage];
    bgImageView.frame = _tabBarView.bounds;
    [_tabBarView addSubview:bgImageView];
    
    if (self.dataSourceModel.isSupportCenterButton) {
        _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_centerButton setImage:self.dataSourceModel.normalCenterButtonImage forState:UIControlStateNormal];
        [_centerButton setImage:self.dataSourceModel.selectedCenterButtonImage forState:UIControlStateSelected];
        _centerButton.frame = CGRectMake((self.frame.size.width - self.dataSourceModel.normalCenterButtonImage.size.width) / 2.0, self.dataSourceModel.space, self.dataSourceModel.normalCenterButtonImage.size.width, self.dataSourceModel.normalCenterButtonImage.size.height);
        [_tabBarView addSubview:_centerButton];
        [_centerButton addTarget:self action:@selector(centerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    NSInteger buttonCount = self.dataSourceModel.tabBarButtons.count;
    NSInteger buttonCountForOneWay = buttonCount / 2.0;
    float buttonWidth = self.frame.size.width / buttonCount;
    float buttonHeight = self.dataSourceModel.rectangleHeight;
    
    if (self.dataSourceModel.isSupportCenterButton) {
        buttonWidth = (self.frame.size.width - self.dataSourceModel.centerButtonSize) / buttonCount;
    }
    
    _tabBarButtons = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < buttonCount; i++) {
        float buttonX = buttonWidth * i;
        
        if (self.dataSourceModel.isSupportCenterButton && i >= buttonCountForOneWay) {
            buttonX = _centerButton.frame.origin.x + _centerButton.frame.size.width + buttonWidth * (i - buttonCountForOneWay);
        }
        
        CNTabBarButtonDataSourceModel *tabBarButtonDataSourceModel = self.dataSourceModel.tabBarButtons[i];
        CNTabBarButton *tabBarButton = [[CNTabBarButton alloc] initWithFrame:CGRectMake(buttonX, self.frame.size.height - buttonHeight, buttonWidth, buttonHeight)];
        tabBarButton.dataSourceModel = tabBarButtonDataSourceModel;
        [_tabBarView addSubview:tabBarButton];
        [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_tabBarButtons addObject:tabBarButton];
    }
}

#pragma mark 按钮点击
- (void)tabBarButtonClick:(CNTabBarButton *)tabBarButton {
    if (_lastTabBarButton == tabBarButton) {
        return;
    }
    
    if (_lastTabBarButton) {
        _lastTabBarButton.selected = NO;
    }
    
    if (self.dataSourceModel.isSupportCenterButton) {
        _centerButton.selected = NO;
    }
    
    _lastTabBarButton = tabBarButton;
    _lastTabBarButton.selected = YES;
    
    if ([self.delegate respondsToSelector:@selector(tabBarButtonClick:)]) {
        [self.delegate tabBarButtonClick:_lastTabBarButton];
    }
}

#pragma mark 中央按钮点击
- (void)centerButtonClick {
    if (_centerButton.selected) {
        return;
    }
    
    if (_lastTabBarButton) {
        _lastTabBarButton.selected = NO;
        _lastTabBarButton = nil;
    }
    
    _centerButton.selected = YES;
    
    if ([self.delegate respondsToSelector:@selector(tabBarCenterButtonClick)]) {
        [self.delegate tabBarCenterButtonClick];
    }
}

#pragma mark -- DataSourceModel GET/SETER
#pragma mark GET
- (CNTabBarDataSource *)dataSourceModel {
    return _dataSourceModel;
}

#pragma mark SET
- (void)setDataSourceModel:(CNTabBarDataSource *)dataSourceModel {
    _dataSourceModel = dataSourceModel;
    
    [self setupUI];
}

@end

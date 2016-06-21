//
//  CNTabBarButton.h
//  LuaViewTestProject
//
//  Created by 余彪 on 16/5/25.
//  Copyright © 2016年 quanXiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNTabBarButtonDataSourceModel.h"


@interface CNTabBarButton : UIButton {
    // 图片组件
    UIImageView *_iconImageView;
    // 文字组件
    UILabel *_titleLabel;
    // 角标组件
    UILabel *_cornerLabel;
    // 新消息组件
    UIImageView *_newsDotImageView;
    // point
    CGPoint _startPoint;
}

// 数据源
@property (nonatomic, copy) CNTabBarButtonDataSourceModel *dataSourceModel;

@end

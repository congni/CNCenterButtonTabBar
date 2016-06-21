//
//  CNTabBarButtonDataSourceModel.m
//  LuaViewTestProject
//
//  Created by 余彪 on 16/5/25.
//  Copyright © 2016年 quanXiang. All rights reserved.
//

#import "CNTabBarButtonDataSourceModel.h"


@implementation CNTabBarButtonDataSourceModel

/**
 *  初始化，写入默认值
 *
 *  @return self
 */
- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.isHaveTitleText = YES;
        self.isSelected = NO;
        self.isCornerZeroHidden = YES;
        self.cornerValue = 0;
        self.spaceImageWithTitle = 3.0;
        self.newsDotColor = [UIColor redColor];
        self.newsDotSize = CGSizeMake(10.0, 10.0);
        self.cornerTitleColor = [UIColor whiteColor];
        self.cornerBackgroundColor = [UIColor redColor];
        self.cornerFont = [UIFont systemFontOfSize:10.0];
    }
    
    return self;
}

@end

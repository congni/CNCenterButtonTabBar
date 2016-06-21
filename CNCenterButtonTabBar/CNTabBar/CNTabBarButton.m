//
//  CNTabBarButton.m
//  LuaViewTestProject
//
//  Created by 余彪 on 16/5/25.
//  Copyright © 2016年 quanXiang. All rights reserved.
//

#import "CNTabBarButton.h"


@implementation CNTabBarButton
@synthesize dataSourceModel = _dataSourceModel;

#pragma mark -- Private Mothod
#pragma mark 设置UI
- (void)setupUI {
    _iconImageView = [[UIImageView alloc] initWithImage:self.dataSourceModel.normalImage];
    _iconImageView.frame = CGRectMake((self.frame.size.width - self.dataSourceModel.normalImage.size.width) / 2.0, (self.frame.size.height - self.dataSourceModel.normalImage.size.height) / 2.0, self.dataSourceModel.normalImage.size.width, self.dataSourceModel.normalImage.size.height);
    [self addSubview:_iconImageView];
    
    if (self.dataSourceModel.isHaveTitleText) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = self.dataSourceModel.normalTitleFont;
        _titleLabel.textColor = self.dataSourceModel.normalTitleColor;
        _titleLabel.text = self.dataSourceModel.titleString;
        [_titleLabel sizeToFit];
        
        float titleLabelTop = _iconImageView.frame.size.height + self.dataSourceModel.spaceImageWithTitle;
        float iconImageTop = (self.frame.size.height - (titleLabelTop + _titleLabel.frame.size.height)) / 2.0;
        
        _iconImageView.frame = CGRectMake(_iconImageView.frame.origin.x, iconImageTop, _iconImageView.frame.size.width, _iconImageView.frame.size.height);
        _titleLabel.frame = CGRectMake((self.frame.size.width - _titleLabel.frame.size.width) / 2.0, titleLabelTop, _titleLabel.frame.size.width, _titleLabel.frame.size.height);
        [self addSubview:_titleLabel];
    }
    
    if (self.dataSourceModel.isSupportNewsDot) {
        float newsDotX = _iconImageView.frame.origin.x + _iconImageView.frame.size.width - self.dataSourceModel.newsDotSize.width / 2.0;
        float newsDotY = _iconImageView.frame.origin.y + self.dataSourceModel.newsDotSize.height / 2.0;
        _newsDotImageView = [[UIImageView alloc] initWithFrame:CGRectMake(newsDotX, newsDotY, self.dataSourceModel.newsDotSize.width, self.dataSourceModel.newsDotSize.height)];
        _newsDotImageView.layer.masksToBounds = YES;
        _newsDotImageView.layer.cornerRadius = self.dataSourceModel.newsDotSize.height / 2.0;
        _newsDotImageView.backgroundColor = self.dataSourceModel.newsDotColor;
        
        [self updateNewsDotStatue];
        [self addSubview:_newsDotImageView];
    } else if (self.dataSourceModel.isSupportCorner) {
        _cornerLabel = [[UILabel alloc] init];
        _cornerLabel.textColor = self.dataSourceModel.cornerTitleColor;
        _cornerLabel.font = self.dataSourceModel.cornerFont;
        _cornerLabel.textAlignment = NSTextAlignmentCenter;
        _cornerLabel.backgroundColor = self.dataSourceModel.cornerBackgroundColor;
        
        [self updateCorner];
        [self addSubview:_cornerLabel];
    }
}

- (void) test{
    
}

#pragma mark 更新新消息状态
- (void)updateNewsDotStatue {
    if (self.dataSourceModel.isSupportNewsDot) {
        _newsDotImageView.hidden = !self.dataSourceModel.isHaveNewsDot;
    }
}

#pragma mark 更新角标
- (void)updateCorner {
    if (self.dataSourceModel.isSupportCorner) {
        _cornerLabel.hidden = self.dataSourceModel.cornerValue <= 0 ? YES : NO;
        
        if (!_cornerLabel.hidden) {
            NSString *cornerString = [NSString stringWithFormat:@"%i", self.dataSourceModel.cornerValue];
            _cornerLabel.text = cornerString;
            [_cornerLabel sizeToFit];
            
            float labelWidth = _cornerLabel.frame.size.width + 10.0;
            float labelHeight = _cornerLabel.frame.size.height + 3.0;
            float newsDotX = _iconImageView.frame.origin.x + _iconImageView.frame.size.width - labelWidth / 2.0;
            float newsDotY = _iconImageView.frame.origin.y;
            
            _cornerLabel.frame = CGRectMake(newsDotX, newsDotY, labelWidth, labelHeight);
            
            if (self.dataSourceModel.cornerValue >= 10) {
                _cornerLabel.layer.cornerRadius = labelWidth / 3.0;
            } else {
                _cornerLabel.layer.cornerRadius = labelWidth / 2.0;
            }
            
            _cornerLabel.layer.masksToBounds = YES;
        }
    }
}

#pragma mark -- dataSourceModel GET/SETER 方法  用于设置UI
#pragma mark dataSourceModel GET方法
- (CNTabBarButtonDataSourceModel *)dataSourceModel {
    return _dataSourceModel;
}

#pragma mark dataSourceModel SET方法
- (void)setDataSourceModel:(CNTabBarButtonDataSourceModel *)dataSourceModel {
    CNTabBarButtonDataSourceModel *oldDataSourceModel = _dataSourceModel;
    _dataSourceModel = dataSourceModel;
    
    if (oldDataSourceModel) {
        [self updateCorner];
        [self updateNewsDotStatue];
    } else {
        [self setupUI];
    }
    
    oldDataSourceModel = nil;
}

#pragma mark Selected SET
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if (selected) {
        _iconImageView.image = self.dataSourceModel.selectedImage;
        
        if (self.dataSourceModel.isHaveTitleText) {
            _titleLabel.textColor = self.dataSourceModel.selectedTitleColor;
        }
        
        if (self.dataSourceModel.isSupportNewsDot) {
            self.dataSourceModel.isHaveNewsDot = NO;
            [self updateNewsDotStatue];
        }
    } else {
        _iconImageView.image = self.dataSourceModel.normalImage;
        
        if (self.dataSourceModel.isHaveTitleText) {
            _titleLabel.textColor = self.dataSourceModel.normalTitleColor;
        }
    }
}

@end

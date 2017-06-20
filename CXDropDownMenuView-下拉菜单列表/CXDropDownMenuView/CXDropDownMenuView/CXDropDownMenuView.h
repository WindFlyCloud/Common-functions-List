//
//  CXDropDownMenuView.h
//  CXDropDownMenuView
//
//  Created by WindXu on 2017/6/20.
//  Copyright © 2017年 YJKJ-CaoXu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CXChooseTitleButton.h"

@class CXDropDownMenuView;

@protocol CXDropDownMenuViewDelegate <NSObject>

@optional

- (void)dropDownMenuView:(CXDropDownMenuView *)dropDownMenuView clickOnCurrentButtonWithTitle:(NSString *)currentTitle andCurrentTitleArray:(NSArray *)currentTitleArray;

@end

@interface CXDropDownMenuView : UIView<UITableViewDelegate, UITableViewDataSource>
/**
 *  提供两种方式处理筛选条件后的业务逻辑(回调方式) - 代理/block 二选一
 */
/* block 点击选择条件按钮 调用 */
typedef void (^ChooseConditionBlock)(NSString *, NSArray *);
/* 代理 */
@property (nonatomic, weak) id<CXDropDownMenuViewDelegate> delegate;
@property (nonatomic, copy) ChooseConditionBlock chooseConditionBlock;

/**
 *  数据源--二维数组
 *  每一个大分类里, 都可以有很多个小分类(条件)
 */
@property (nonatomic, strong) NSMutableArray *dataSourceArr;

/* 默认显示的 */
@property (nonatomic, strong) NSArray *defaulTitleArray;

/* 分类按钮 数组 */
@property (nonatomic, strong) NSMutableArray *titleBtnArr;

/* 分类内容 动画起始位置 */
@property (nonatomic, assign) CGFloat startY;

/**
 * 公有方法, 供外界使用
 */
- (void)show;

@end

@interface CXTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@end

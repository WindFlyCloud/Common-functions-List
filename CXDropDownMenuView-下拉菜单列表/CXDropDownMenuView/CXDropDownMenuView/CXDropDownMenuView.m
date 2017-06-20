//
//  CXDropDownMenuView.m
//  CXDropDownMenuView
//
//  Created by WindXu on 2017/6/20.
//  Copyright © 2017年 YJKJ-CaoXu. All rights reserved.
//

#import "CXDropDownMenuView.h"
#import "Configure.h"
#import "UIView+CXFrame.h"


#define kTitleBarHeight 45
#define kViewTagConstant 1  // 所有tag都加上这个 防止出现为0的tag

@implementation CXTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 44)];
    _titleLabel.contentMode = UIViewContentModeCenter;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
}
@end

@interface CXDropDownMenuView ()

/* 分类 classifyView */
@property (nonatomic, strong) UIView *titleBar;

/* 整个屏幕的 背景 半透明View */
@property (nonatomic, strong) UIView *bgView;

/**
 *  cell为筛选的条件
 */
@property (nonatomic, strong) UITableView *dropDownMenuTableView;

/**
 *  数据源--一维数组 (每一列的条件标题)
 */
@property (nonatomic, strong) NSArray *dataSource;

/* 最后点击的按钮 */
@property (nonatomic, strong) UIButton *lastClickedBtn;

@end
@implementation CXDropDownMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleBar];
    }
    return self;
}



#pragma mark - lazy
/* 分类 classifyView */
- (UIView *)titleBar
{
    if (!_titleBar) {
        _titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kTitleBarHeight)];
        _titleBar.backgroundColor = [UIColor whiteColor];
    }
    return _titleBar;
}

#pragma mark - setter
- (void)setDataSourceArr:(NSMutableArray *)dataSourceArr
{
    _dataSourceArr = dataSourceArr;
    
    self.titleBtnArr = [[NSMutableArray alloc] init];
    
    CGFloat btnW = kDeviceWidth/dataSourceArr.count;
    CGFloat btnH = kTitleBarHeight;
    
    for (NSInteger i=0; i<dataSourceArr.count; i++) {
        CXChooseTitleButton *titleBtn = [CXChooseTitleButton createButtonWithImageName:@"down_icon.png" selectImgName:@"up_icon" title:@"" titleColor:CF_Color_TextDarkGrayColor frame:CGRectMake(i*btnW, 0, btnW, btnH) target:self action:@selector(titleBtnClicked:)];
        
        titleBtn.tag = i+kViewTagConstant;  // 所有tag都加上这个, 防止出现为0的tag
        
        [self.titleBar addSubview:titleBtn];
        
        [self.titleBtnArr addObject:titleBtn];  // 分类 按钮数组
    }
    
    // 中间分割竖线
    for (NSInteger i=0; i<dataSourceArr.count-1; i++) {
        UIView *line = [UIView viewWithFrame:CGRectMake(btnW*(i+1), 0, 0.5, btnH) backgroundColor:CF_Color_SepertLineColor];
        [self.titleBar addSubview:line];
    }
}


// 设置文字 默认
- (void)setDefaulTitleArray:(NSArray *)defaulTitleArray
{
    _defaulTitleArray = defaulTitleArray;
    for (NSInteger i = 0; i < self.titleBtnArr.count; i++) {
        [self.titleBtnArr[i] setTitle:defaulTitleArray[i] forState:UIControlStateNormal];
        
    }
}

#pragma mark - 按钮点击
- (void)titleBtnClicked:(UIButton *)btn
{
    _lastClickedBtn = btn;
    [self removeSubviews];
    self.dataSource = self.dataSourceArr[btn.tag-kViewTagConstant];
    
    // 加上 选择内容
    [self show];
    // 按钮动画
    [self animationWhenClickTitleBtn:btn];
    
}


#pragma mark - public
// 点击按钮动画
- (void)animationWhenClickTitleBtn:(UIButton *)btn
{
    _lastClickedBtn = btn;
    /**
     *  0.0.3  箭头方向错了bug解决
     */
    for (UIButton *subBtn in self.titleBtnArr) {
        if (subBtn==btn) {
            [UIView animateWithDuration:0.25 animations:^{
                //                subBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
                //                subBtn.enabled = NO;
                subBtn.userInteractionEnabled = NO;
                subBtn.selected = YES;
            }];
        } else {
            [UIView animateWithDuration:0.25 animations:^{
                //                subBtn.imageView.transform = CGAffineTransformMakeRotation(0);
                //                subBtn.enabled = YES;
                subBtn.userInteractionEnabled = YES;
                subBtn.selected = NO;
            }];
        }
    }
}

#pragma mark - lazy
/* 蒙层view */
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.startY, kDeviceWidth, kDeviceHeight)];
        _bgView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [_bgView addGestureRecognizer:tapGest];
    }
    return _bgView;
}

/* 分类内容 */
- (UITableView *)dropDownMenuTableView
{
    if (!_dropDownMenuTableView) {
        _dropDownMenuTableView = [[UITableView alloc] init];
        _dropDownMenuTableView.frame = CGRectMake(0, self.startY, kDeviceWidth, 0);
        _dropDownMenuTableView.backgroundColor = [UIColor whiteColor];
        _dropDownMenuTableView.delegate = self;
        _dropDownMenuTableView.dataSource = self;
        _dropDownMenuTableView.scrollEnabled = YES;
    }
    return _dropDownMenuTableView;
}

#pragma mark - public
- (void)show {
    
    [self.superview addSubview:self.bgView];
    [self.superview addSubview:self.dropDownMenuTableView];
    [UIView animateWithDuration:0.25 animations:^{
        self.dropDownMenuTableView.frame = CGRectMake(0, self.startY, kDeviceWidth, MIN(44 * 5, 44 * self.dataSource.count));
        
    } completion:^(BOOL finished) {
        [self.dropDownMenuTableView reloadData];
    }];
}

#pragma mark - private
- (void)hide {
    [UIView animateWithDuration:0.3 animations:^{
        self.dropDownMenuTableView.frame = CGRectMake(0, self.startY, kDeviceWidth, 0);
        _lastClickedBtn.imageView.transform = CGAffineTransformMakeRotation(0.01);
    } completion:^(BOOL finished) {
        [self removeSubviews];
        //        [self btnEnable];
    }];
    
}

- (void)removeSubviews
{
    [UIView animateWithDuration:0.25 animations:^{
        _lastClickedBtn.imageView.transform = CGAffineTransformMakeRotation(0.01);
    }];
    // 此处 千万不能写作 !self.bgView?:[self.bgView removeFromSuperview];  会崩
    !_bgView?:[_bgView removeFromSuperview];
    _bgView=nil;
    
    !_dropDownMenuTableView?:[_dropDownMenuTableView removeFromSuperview];
    _dropDownMenuTableView=nil;
    
    self.dataSource = nil;
    
    [self btnEnable];
}



- (void)btnEnable
{
    // 所有 分类按钮  都变为 可点击
    for (NSInteger i=0; i<self.dataSourceArr.count; i++) {
        UIButton *btn = self.titleBtnArr[i];
        //        btn.enabled = YES;
        btn.userInteractionEnabled = YES;
        btn.selected = NO;
    }
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    
    CXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[CXTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.titleLabel.font = CF_Font_17;
    }
    
    
    cell.titleLabel.text = self.dataSource[indexPath.row];
    // KVC
    NSArray *textArr = [self.titleBtnArr valueForKeyPath:@"titleLabel.text"];
    
    {
        if ([textArr containsObject:cell.titleLabel.text]){
            //            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            cell.titleLabel.textColor = CF_Color_DefaultColor;
        } else {
            //            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.titleLabel.textColor = CF_Color_TextDarkGrayColor;
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 改变标题展示 及 颜色
    NSMutableArray *currentTitleArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < self.dataSourceArr.count; i++) {
        UIButton *btn = self.titleBtnArr[i];
        if (!btn.userInteractionEnabled) {
            [btn setTitle:self.dataSource[indexPath.row] forState:UIControlStateNormal];
        }
        [currentTitleArr addObject:btn.titleLabel.text];
    }
    
    /**
     *  筛选条件后的回调方式 代理/block 二选一
     */
    // 调用代理 传参数(当前选中的分类) --- 走接口 请求数据
    if (self.delegate && [self.delegate respondsToSelector:@selector(dropDownMenuView:clickOnCurrentButtonWithTitle:andCurrentTitleArray:)]) {
        [self.delegate dropDownMenuView:self clickOnCurrentButtonWithTitle:self.dataSource[indexPath.row] andCurrentTitleArray:currentTitleArr];
    }
    
    // 走block  3目运算,有block则执行;否则不执行
    !self.chooseConditionBlock?:self.chooseConditionBlock(self.dataSource[indexPath.row],currentTitleArr);
    
    // 移除
    [self removeSubviews];
    
}

- (void)dealloc
{
    [self removeSubviews];
}

@end

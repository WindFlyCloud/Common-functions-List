//
//  CXChooseTitleButton.m
//  CXDropDownMenuView
//
//  Created by WindXu on 2017/6/20.
//  Copyright © 2017年 YJKJ-CaoXu. All rights reserved.
//

#import "CXChooseTitleButton.h"
#import "Configure.h"
#import "UIView+CXFrame.h"

@implementation CXChooseTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 默认设置
        [self setTitleColor:CF_Color_TextGrayColor forState:UIControlStateNormal];
        self.titleLabel.font = CF_Font_17;
        
        
    }
    return self;
}

+ (instancetype)createButtonWithImageName:(NSString *)imgName selectImgName:(NSString *)selectImgName title:(NSString *)title titleColor:(UIColor *)titleColor frame:(CGRect)btnFrame target:(id)target action:(SEL)action
{
    CXChooseTitleButton *btn = [self buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectImgName] forState:UIControlStateSelected];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:CF_Color_DefaultColor forState:UIControlStateSelected];
    [btn sizeToFit];
    btn.frame = btnFrame;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGFloat imageWidth = self.imageView.cx_width+1;
    CGFloat labelWidth = self.titleLabel.cx_width+1;
    
    // 图片 位置（右）
    self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth);
    
    
    // 文字 位置（左边）
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
    
    
}


@end

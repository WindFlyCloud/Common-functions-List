//
//  UIView+CXFrame.h
//  CXDropDownMenuView
//
//  Created by WindXu on 2017/6/20.
//  Copyright © 2017年 YJKJ-CaoXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CXFrame)

@property (nonatomic, assign) CGFloat cx_x;
@property (nonatomic, assign) CGFloat cx_y;
@property (nonatomic, assign) CGFloat cx_centerX;
@property (nonatomic, assign) CGFloat cx_centerY;
@property (nonatomic, assign) CGFloat cx_width;
@property (nonatomic, assign) CGFloat cx_height;

@property (nonatomic, assign, readonly) CGFloat cx_maxX;
@property (nonatomic, assign, readonly) CGFloat cx_maxY;

@property (nonatomic, assign) CGPoint cx_origin;
@property (nonatomic, assign) CGSize cx_size;

+ (instancetype)viewWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;
+ (instancetype)viewWithFrame:(CGRect)frame;
+ (instancetype)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)color;


@end

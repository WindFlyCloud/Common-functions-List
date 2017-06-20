//
//  UIView+CXFrame.m
//  CXDropDownMenuView
//
//  Created by WindXu on 2017/6/20.
//  Copyright © 2017年 YJKJ-CaoXu. All rights reserved.
//

#import "UIView+CXFrame.h"

@implementation UIView (CXFrame)
//---------- X ----------//
-(void)setCx_x:(CGFloat)cx_x {
    CGRect frame = self.frame;
    frame.origin.x = cx_x;
    self.frame = frame;
}
- (CGFloat)cx_x {
    return self.frame.origin.x;
}

//---------- Y ----------//
- (void)setCx_y:(CGFloat)cx_y {
    CGRect frame = self.frame;
    frame.origin.y = cx_y;
    self.frame = frame;
}

- (CGFloat)cx_y {
    return self.frame.origin.y;
}

//---------- CenterX ----------//
- (void)setCx_centerX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)cx_centerX {
    return self.center.x;
}

//---------- CenterY ----------//
- (void)setCx_centerY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)cx_centerY {
    return self.center.y;
}

//---------- Width ----------//
- (void)setCx_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)cx_width {
    return self.frame.size.width;
}

//---------- Height ----------//
- (void)setCx_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)cx_height {
    return self.frame.size.height;
}

//---------- Origin ----------//
- (void)setCx_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)cx_origin {
    return self.frame.origin;
}

//---------- Size ----------//
- (void)setCx_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)cx_size {
    return self.frame.size;
}

- (CGFloat)cx_maxX {
    return self.frame.size.width + self.frame.origin.x;
}

- (CGFloat)cx_maxY {
    return self.frame.size.height + self.frame.origin.y;
}


+ (instancetype)viewWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height
{
    return [[self alloc] initWithFrame:CGRectMake(x, y, width, height)];
}

+ (instancetype)viewWithFrame:(CGRect)frame
{
    return [[UIView alloc] initWithFrame:frame];
}

+ (instancetype)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)color
{
    UIView *view = [self viewWithFrame:frame];
    view.backgroundColor = color;
    return view;
}

@end

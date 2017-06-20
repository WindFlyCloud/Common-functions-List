
//
//  Configure.h
//  CXDropDownMenuView
//
//  Created by WindXu on 2017/6/20.
//  Copyright © 2017年 YJKJ-CaoXu. All rights reserved.
//

#ifndef Configure_h
#define Configure_h

#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width

/**
 *  颜色相关 宏
 */
#define UIColorFromHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]
#define  CF_Color_TextLightGrayColor UIColorFromHex(0x999999)
#define  CF_Color_TextGrayColor UIColorFromHex(0x666666)
#define  CF_Color_TextDarkGrayColor UIColorFromHex(0x333333)
#define  CF_Color_SepertLineColor UIColorFromHex(0xdddddd)
#define  CF_Color_DefaultColor  UIColorFromHex(0x1e8cd4)  // 默认的颜色-蓝
#define  CF_Color_DefalutBackGroundColor UIColorFromHex(0xf2f2f2)

/**
 *  字体相关 宏
 */
#define CF_Font_17 [UIFont systemFontOfSize:17]

#endif /* Configure_h */

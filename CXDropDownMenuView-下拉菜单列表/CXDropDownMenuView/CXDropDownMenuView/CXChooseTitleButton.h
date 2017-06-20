//
//  CXChooseTitleButton.h
//  CXDropDownMenuView
//
//  Created by WindXu on 2017/6/20.
//  Copyright © 2017年 YJKJ-CaoXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXChooseTitleButton : UIButton

+ (instancetype)createButtonWithImageName:(NSString *)imgName selectImgName:(NSString *)selectImgName title:(NSString *)title titleColor:(UIColor *)titleColor frame:(CGRect)btnFrame target:(id)target action:(SEL)action;

@end

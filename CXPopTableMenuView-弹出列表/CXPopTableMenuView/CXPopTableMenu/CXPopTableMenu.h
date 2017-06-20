//
//  CXPopTableMenu.h
//  LTTeacher
//
//  Created by WindXu on 17/3/14.
//  Copyright © 2017年 Zebra. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CXPopTableMenuDelegate <NSObject>

@required

- (void)didSelectedAtIndexPath:(NSIndexPath *)indexPath;

@end

typedef void(^dismissWithOperation)();

typedef NS_ENUM(NSUInteger,CXPopMenuDirection) {
    kCXPopMenuDirectionLeft = 1,
    kCXPopMenuDirectionRight
};
@interface CXPopTableMenu : UIView

@property (nonatomic, weak) id<CXPopTableMenuDelegate> delegate;
@property (nonatomic, strong) dismissWithOperation dismissOperation;

//初始化方法
//传入参数：模型数组，弹出原点，宽度，高度（每个cell的高度）
- (instancetype)initWithDataArray:(NSArray *)dataArray
                           origin:(CGPoint)origin
                            width:(CGFloat)width
                           height:(CGFloat)height
                        direction:(CXPopMenuDirection)direction;
//弹出
- (void)pop;
//消失
- (void)dismiss;

@end


@interface CXCellModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageName;

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName;

@end

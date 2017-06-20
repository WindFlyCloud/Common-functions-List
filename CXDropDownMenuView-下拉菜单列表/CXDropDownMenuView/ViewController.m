//
//  ViewController.m
//  CXDropDownMenuView
//
//  Created by WindXu on 2017/6/20.
//  Copyright © 2017年 YJKJ-CaoXu. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CXFrame.h"
#import "Configure.h"
#import "CXDropDownMenuView.h"

@interface ViewController ()<CXDropDownMenuViewDelegate>

@property (nonatomic, strong) CXDropDownMenuView *dropDownMenuView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.dropDownMenuView];
    

}
#pragma mark - lazy
/* 配置CFDropDownMenuView */
- (CXDropDownMenuView *)dropDownMenuView
{
    // DEMO
    _dropDownMenuView = [[CXDropDownMenuView alloc] initWithFrame:CGRectMake(0, 24, kDeviceWidth, 45)];
    
    _dropDownMenuView.dataSourceArr = @[
                                        @[@"全部", @"iOS开发", @"安卓开发", @"JAVA开发", @"PHP开发"],
                                        @[@"1年以内", @"1-3年", @"3-5年", @"5年以上"]
                                        ].mutableCopy;

    _dropDownMenuView.defaulTitleArray = [NSArray arrayWithObjects:@"全部",@"1年以内", nil];
    
    _dropDownMenuView.delegate = self;
    
    // 下拉列表 起始y
    _dropDownMenuView.startY = CGRectGetMaxY(_dropDownMenuView.frame);
    
    /**
     *  回调方式一: block
     */
    __weak typeof(self) weakSelf = self;
    _dropDownMenuView.chooseConditionBlock = ^(NSString *currentTitle, NSArray *currentTitleArray){
                NSLog(@"currentTitle--%@ currentTitleArray--%@",currentTitle,currentTitleArray);

    };
    
    
    return _dropDownMenuView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

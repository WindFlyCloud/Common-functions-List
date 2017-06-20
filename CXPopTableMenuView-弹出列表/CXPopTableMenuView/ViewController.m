//
//  ViewController.m
//  CXPopTableMenuView
//
//  Created by WindXu on 2017/6/20.
//  Copyright © 2017年 YJKJ-CaoXu. All rights reserved.
//

#import "ViewController.h"
#import "CXPopTableMenu.h"

@interface ViewController ()<CXPopTableMenuDelegate>

@property (nonatomic, strong) UIButton              *rightBtn;
@property (nonatomic, strong) NSMutableArray        *managerArr;
@property (nonatomic, strong) CXPopTableMenu        *popView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"弹出框";
    
    [self.view addSubview:self.rightBtn];
}

-(NSMutableArray *)managerArr {
    if (!_managerArr) {
        _managerArr = [[NSMutableArray alloc]init];
        NSArray * modelArr = @[@"上传照片",@"删除照片",@"删除相册",@"修改名称"];
        for (int i = 0; i < modelArr.count; i++) {
            CXCellModel * model = [[CXCellModel alloc]initWithTitle:modelArr[i] imageName:@""];
            [_managerArr addObject:model];
        }
    }
    return _managerArr;
}
-(UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(300, 100, 50, 18);
        [_rightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_rightBtn setTitle:@"管理" forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(uploadPhoto:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
- (void)uploadPhoto:(UIButton *)uploadBtn  {
    
    CGFloat x = _rightBtn.center.x + 10;
    CGFloat y = _rightBtn.frame.origin.y + _rightBtn.bounds.size.height + 10 +20;
    _popView = [[CXPopTableMenu alloc] initWithDataArray:self.managerArr origin:CGPointMake(x, y) width:110 height:44 direction:kCXPopMenuDirectionRight];
    _popView.delegate = self;
    _popView.dismissOperation = ^(){
        //设置成nil，以防内存泄露
        _popView = nil;
    };
    [_popView pop];
    
}

#pragma mark CXPopTableMenuDelegate
- (void)didSelectedAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath.row---%d",indexPath.row);
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

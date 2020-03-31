//
//  LZDViewController.m
//  LZDTools
//
//  Created by 511815816@qq.com on 03/31/2020.
//  Copyright (c) 2020 511815816@qq.com. All rights reserved.
//

#import "LZDViewController.h"
#import "LZDNextViewController.h"
#import "UINavigationController+Cloudox.h"
#import "UIViewController+Cloudox.h"

@interface LZDViewController ()

@end

@implementation LZDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"First View";
    //    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithRed:0x32/255.0f green:0xAB/255.0f blue:0x64/255.0f alpha:1.0f];
    //    self.navigationController.delegate = self.navigationController;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [btn setTitle:@"Next View" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(toNextView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.navigationController.cloudox = @"hey，this is category!";
    NSLog(@"%@", self.navigationController.cloudox);
    
    [self getSub:self.navigationController.navigationBar andLevel:1];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    self.navBarBgAlpha = @"1.0";
}

// 获取子视图
- (void)getSub:(UIView *)view andLevel:(int)level {
    NSArray *subviews = [view subviews];
    if ([subviews count] == 0) return;
    for (UIView *subview in subviews) {
        
        NSString *blank = @"";
        for (int i = 1; i < level; i++) {
            blank = [NSString stringWithFormat:@"  %@", blank];
        }
        NSLog(@"%@%d: %@", blank, level, subview.class);
        [self getSub:subview andLevel:(level+1)];
        
    }
}

// 按钮响应
- (void)toNextView {
    LZDNextViewController *nextVC = [[LZDNextViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

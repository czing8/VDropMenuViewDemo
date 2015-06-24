//
//  ViewController.m
//  VDropMenuViewDemo
//
//  Created by Vols on 15/6/24.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "ViewController.h"

#import "VDropMenuView.h"

@interface ViewController () <VDropMenuViewDelegate, VDropMenuViewDataSource>{
    VDropMenuView* menuView;
    NSArray* menuInfo;
    
    UITableView* tableview;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"T型展开菜单";
    
    tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableview];
    tableview.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
    
    
    menuInfo = @[@"全部分类",@"地区",@"综合排序",@"优惠活动"];
    
    menuView = [[VDropMenuView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 44)];
    menuView.backgroundColor = [UIColor colorWithRed:0.973 green:0.973 blue:0.973 alpha:1];
    menuView.delegate = self;
    menuView.dataSource = self;
//    menuView.
    [self.view addSubview:menuView];
    
    UIView* showView = [[UIView alloc] initWithFrame:CGRectMake(0, menuView.frame.origin.y+menuView.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height-64-44)];
    showView.backgroundColor = [UIColor colorWithRed:0.145 green:0.145 blue:0.145 alpha:0.65];
    [self.view addSubview:showView];
    
    menuView.showView = showView;
}

- (UIColor *)randomColor {
    static BOOL seeded = NO;
    if (!seeded) {
        seeded = YES;
        (time(NULL));
    }
    CGFloat red = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

#pragma mark - VDropMenuViewDataSource

- (NSInteger)numberOfItemsInMenuView:(VDropMenuView *)menuview{
    return menuInfo.count;
}
- (NSString*)menuView:(VDropMenuView *)menuview titleForItemAtIndex:(NSInteger)index{
    return menuInfo[index];
}
- (CGFloat)menuView:(VDropMenuView *)menuview heightForCurViewAtIndex:(NSInteger)index{
    return 200+index*50;
}

- (UIView*)menuView:(VDropMenuView *)menuview curViewAtIndex:(NSInteger)index{
    UIView* vv = [[UIView alloc] initWithFrame:CGRectZero];
    vv.backgroundColor = [self randomColor];
    
    return vv;
}

#pragma mark - VDropMenuViewDelegate

- (void)menuView:(VDropMenuView *)menuView didSelectAtIndex:(NSInteger)index{
    NSLog(@"show row = %ld",(long)index);
    
}

- (void)menuView:(VDropMenuView *)menuView didRemoveAtIndex:(NSInteger)index{
    NSLog(@"remove row = %ld",(long)index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

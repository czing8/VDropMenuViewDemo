//
//  VDropMenuView.h
//  VDropMenuViewDemo
//
//  Created by Vols on 15/6/24.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VMenuItem.h"

#define DurationTime 0.35


@class VDropMenuView;

@protocol VDropMenuViewDataSource <NSObject>

- (NSInteger)numberOfItemsInMenuView:(VDropMenuView*)menuView;

- (NSString *)menuView:(VDropMenuView*)menuView titleForItemAtIndex:(NSInteger)index;

- (CGFloat)menuView:(VDropMenuView*)menuView heightForCurViewAtIndex:(NSInteger)index;
- (UIView *)menuView:(VDropMenuView*)menuView curViewAtIndex:(NSInteger)index;

@end


@protocol VDropMenuViewDelegate <NSObject>

- (void)menuView:(VDropMenuView*)menuView didSelectAtIndex:(NSInteger)index;
- (void)menuView:(VDropMenuView *)menuView didRemoveAtIndex:(NSInteger)index;

@end

@interface VDropMenuView : UIView

@property (nonatomic,weak) id<VDropMenuViewDelegate> delegate;
@property (nonatomic,weak) id<VDropMenuViewDataSource> dataSource;

@property (nonatomic,strong) UIView* showView;  //背景层

- (void)closeCurViewWithIndex:(NSInteger)index; //在当前视图的操作中如需关闭视图，执行此方法

@end

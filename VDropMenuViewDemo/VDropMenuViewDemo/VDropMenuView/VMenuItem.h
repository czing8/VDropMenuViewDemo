//
//  VMenuItem.h
//  VDropMenuViewDemo
//
//  Created by Vols on 15/6/24.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TEXTFONT [UIFont systemFontOfSize:13.0f]

typedef NS_ENUM(NSUInteger, MarkAlignment){
    MarkAlignmentNone = 0,
    MarkAlignmentLeft,
    MarkAlignmentRight,
};

@interface VMenuItem : UIView

@property (nonatomic,strong) UILabel* titleLabel;
@property (nonatomic,strong) UIImageView* markImgView;

@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) UIImage* markImg;
@property (nonatomic,strong) UIImage* backgroundImage;
@property (nonatomic,assign) MarkAlignment markAlignment; // 默认 LSMarkAlignmentRight

- (void)settitleColor:(UIColor*)color;

@end

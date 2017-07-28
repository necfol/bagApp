//
//  NecfolShopView.m
//  firstDemo
//
//  Created by necfol on 2017/7/28.
//  Copyright © 2017年 Necfol. All rights reserved.
//

#import "NecfolShopView.h"
#import "Shop.h"

@interface NecfolShopView()
/** 定义image*/
@property (nonatomic, strong) UIImageView *img;

/** 定义label*/
@property (nonatomic, strong) UILabel *label;

@end

@implementation NecfolShopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(instancetype)ShopView {
    return [[self alloc] init];
}

/**
 init默认会调用initwithframe:方法
 */
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.img = [[UIImageView alloc] init];
        self.label = [[UILabel alloc] init];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.img];
        [self addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat shopW = self.frame.size.width;
    CGFloat shopH = self.frame.size.height;
    self.img.frame = CGRectMake(0, 0, shopW, shopW);
    self.label.frame = CGRectMake(0, shopW, shopW, shopH - shopW);
}

- (void)setShop:(Shop *)shop {
    _shop = shop;
    self.label.text = shop.text;
    self.img.image = [UIImage imageNamed:shop.img];
}
@end

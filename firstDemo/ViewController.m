//
//  ViewController.m
//  firstDemo
//
//  Created by necfol on 2017/7/27.
//  Copyright © 2017年 Necfol. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopView;
@property (weak, nonatomic) UIButton *addBtn;
@property (weak, nonatomic) UIButton *removeBtn;
@property (strong, nonatomic) NSArray *shops;
@property (weak, nonatomic) IBOutlet UILabel *hub;

@end

@implementation ViewController

- (UIButton *) createBtnWithImage: (NSString *)img highLightedImage:(NSString *)highLightedImage disabledImage:(NSString *)disabledImage frame:(CGRect) frame selector:(SEL)selector {
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highLightedImage] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:disabledImage] forState:UIControlStateDisabled];
    btn.frame = frame;
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    return btn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *file = [bundle pathForResource:@"shops" ofType:@"plist"];
    self.shops = [NSArray arrayWithContentsOfFile:file];
    self.addBtn = [self createBtnWithImage:@"add" highLightedImage:@"add_highlighted" disabledImage:@"add_disabled" frame:CGRectMake(30, 30, 50, 50) selector:@selector(add)];
    self.removeBtn = [self createBtnWithImage:@"remove" highLightedImage:@"remove_highlighted" disabledImage:@"remove_disabled" frame:CGRectMake(300, 30, 50, 50) selector:@selector(remove)];
    [self.removeBtn setEnabled:NO];
    self.hub.alpha = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) add {
    int cols = 3;
    CGFloat shopW = 70;
    CGFloat shopH = 90;
    CGFloat colMargin = (self.shopView.frame.size.width - cols * shopW) / (cols - 1);
    NSUInteger index = self.shopView.subviews.count;
    NSDictionary * shop = self.shops[index];
    NSUInteger col = index % cols;
    CGFloat shopX = col * (shopW + colMargin);
    NSUInteger rowMargin = 10;
    NSUInteger row = index / cols;
    CGFloat shopY = row * (shopH + rowMargin);
    UIView *shopItem = [[UIView alloc] init];
    shopItem.frame = CGRectMake(shopX, shopY, shopW, shopH);
    UIImageView *img = [[UIImageView alloc] init];
    img.image = [UIImage imageNamed:shop[@"img"]];
    img.frame = CGRectMake(0, 0, shopW, shopW); 
    UILabel *label = [[UILabel alloc] init];
    label.text = shop[@"text"];
    label.frame = CGRectMake(0, shopW, shopW, shopH - shopW);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    [shopItem addSubview:img];
    [shopItem addSubview:label];
    [self.shopView addSubview:shopItem];
    [self checkBtnState];

}
- (void) remove {
    [self.shopView.subviews.lastObject removeFromSuperview];
    [self checkBtnState];
}
- (void) checkBtnState {
    self.removeBtn.enabled = (self.shopView.subviews.count != 0);
    self.addBtn.enabled = (self.shopView.subviews.count < self.shops.count);
    NSString *text = nil;
    if(self.addBtn.enabled == NO) {
        text = @"已经加满啦！";
    } else if(self.removeBtn.enabled == NO) {
        text = @"已经删光啦！";
    }
    if(!text) return;
    self.hub.text = text;
    self.hub.alpha = 1.0;
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(hideHub) userInfo:nil repeats:NO];
}
- (void) hideHub {
    self.hub.alpha = 0;

}
@end

//
//  Shop.m
//  firstDemo
//
//  Created by necfol on 2017/7/28.
//  Copyright © 2017年 Necfol. All rights reserved.
//

#import "Shop.h"

@implementation Shop
-(instancetype)initWithDic:(NSDictionary *)dic {
    if(self = [super init]) {
        self.text = dic[@"text"];
        self.img = dic[@"img"];
    }
    return self;
}

//类方法名通常以类名开头
+(instancetype)shopWithDic:(NSDictionary *)dic {
    return [[Shop alloc]initWithDic:dic];
}

@end

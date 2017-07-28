//
//  Shop.h
//  firstDemo
//
//  Created by necfol on 2017/7/28.
//  Copyright © 2017年 Necfol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

/**商品名称*/
@property (nonatomic, strong) NSString *text;
/**商品图片*/
@property (nonatomic, strong) NSString *img;

- (instancetype)initWithDic: (NSDictionary *)dic;
//类方法名通常以类名开头
+ (instancetype)shopWithDic: (NSDictionary *)dic;

@end

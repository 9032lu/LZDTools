//
//  NSObject+LZD_Random.h
//  LeasingPlatform
//
//  Created by 鲁征东 on 2020/4/15.
//  Copyright © 2020 柒点云. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LZD_Random)
// 获取 [to from] 之间的数据
+ (NSInteger) lzd_randomNumber:(NSInteger)from to:(NSInteger)to;

/**
 清空属性值
 */
- (void)cleanWithAllProperties;
@end

NS_ASSUME_NONNULL_END

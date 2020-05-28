//
//  NSObject+LZD_Random.m
//  LeasingPlatform
//
//  Created by 鲁征东 on 2020/4/15.
//  Copyright © 2020 柒点云. All rights reserved.
//

#import "NSObject+LZD_Random.h"
#import <objc/runtime.h>
@implementation NSObject (LZD_Random)

// 获取 [to from] 之间的数据
+ (NSInteger) lzd_randomNumber:(NSInteger)from to:(NSInteger)to
{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));

}


/**
 清空属性值
 */
- (void)cleanWithAllProperties {
    unsigned int pro_count = 0;
    // 获取该类中所有属性列表
    objc_property_t *properties = class_copyPropertyList([self class], &pro_count);
    // for循环遍历所有属性
    for (int i = 0; i < pro_count; i ++) {
        objc_property_t property = properties[i];
        // 得到当前属性的名字（字符串形式）
        NSString *propertyName = [NSString stringWithFormat:@"%s", property_getName(property)];
        // 使用KVC方式得到该属性的值
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        
        // null的就不用管了
        if (!propertyValue ||
            [propertyValue isKindOfClass:[NSNull class]]) {
            continue;
        }
        
        // !!!:同样通过KVC的方式赋值

        if ([propertyValue isKindOfClass:[NSString class]]) {
            // 字符串类型
            [self setValue:@"" forKey:propertyName];
            NSLog(@"--> 清理用户信息[%@]成功 NSString:%@",propertyName,propertyValue);
        }
        else if ([propertyValue isKindOfClass:[NSNumber class]]) {
            // bool int float long ...
            [self setValue:[NSNumber numberWithInteger:0] forKey:propertyName];
            NSLog(@"--> 清理用户信息[%@]成功 NSNumber:%@",propertyName,propertyValue);
        }
        else if ([propertyValue isKindOfClass:[NSMutableDictionary class]] ||
                 [propertyValue isKindOfClass:[NSDictionary class]]) {
            // 字典
            [self setValue:@{} forKey:propertyName];
            NSLog(@"--> 清理用户信息[%@]成功 NSDictionary:%@",propertyName,propertyValue);
        }
        else if ([propertyValue isKindOfClass:[NSMutableArray class]] ||
                 [propertyValue isKindOfClass:[NSArray class]]) {
            // 数组
            [self setValue:@[] forKey:propertyName];
            NSLog(@"--> 清理用户信息[%@]成功 NSArray:%@",propertyName,propertyValue);
        }
        else {
            // 其他未知类型 包括data
            // 这里还可以增加其他判断...
            [self setValue:nil forKey:propertyName];
            NSLog(@"--> 清理用户信息[%@]成功 其他未知类型:%@",propertyName,propertyValue);
        }
    }
    // 释放
    free(properties);
    
    /*
    // 置空父类(PowerStationForHouseholdModel)的属性值
    pro_count = 0;
    objc_property_t *properties_super = class_copyPropertyList([self superclass], &pro_count);
    for (int i = 0; i < pro_count; i ++) {
        objc_property_t property = properties_super[i];
        NSString *propertyName = [NSString stringWithFormat:@"%s", property_getName(property)];
        // 可以自己根据要求修改
        [self setValue:nil forKey:propertyName];
    }
    free(properties_super);
     */
}

@end

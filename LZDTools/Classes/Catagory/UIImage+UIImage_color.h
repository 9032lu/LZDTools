//
//  UIImage+UIImage_color.h
//  LZDTools
//
//  Created by ZhangTu on 2019/3/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (UIImage_color)

/**
 根据颜色生成纯色图片

 @param color 颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END

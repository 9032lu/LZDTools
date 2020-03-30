//
//  UIButton+LZDImageTitleSpacing.h
//  LZDTools
//
//  Created by ZhangTu on 2019/3/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,LZDButtonEdgeInsetsStyle){
    
    LZDButtonEdgeInsetsStyleTop,// image在上，label在下
    LZDButtonEdgeInsetsStyleLeft,// image在左，label在右
    LZDButtonEdgeInsetsStyleBottom,// image在下，label在上
    LZDButtonEdgeInsetsStyleRight,// image在右，label在左
    LZDButtonEdgeInsetsStyleRightBottom
    
};

@interface UIButton (LZDImageTitleSpacing)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(LZDButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END

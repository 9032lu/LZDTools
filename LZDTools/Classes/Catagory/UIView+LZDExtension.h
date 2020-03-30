//
//  UIView+LZDExtension.h
//  LZDTools
//
//  Created by ZhangTu on 2019/3/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LZDExtension)
@property (nonatomic, assign) CGFloat lzdx;
@property (nonatomic, assign) CGFloat lzdy;
@property (nonatomic, assign) CGFloat lzdbottom;
@property (nonatomic, assign) CGFloat lzdright;
@property (nonatomic, assign) CGFloat lzdcenterX;
@property (nonatomic, assign) CGFloat lzdcenterY;
@property (nonatomic, assign) CGFloat lzdwidth;
@property (nonatomic, assign) CGFloat lzdheight;
@property (nonatomic, assign) CGPoint lzdorigin;
@property (nonatomic, assign) CGSize lzdsize;

/**
 寻找当前view所在的主视图控制器
 
 @return 返回当前主视图控制器
 */
- (UIViewController *)viewController;

// 登陆后淡入淡出更换rootViewController
+(void)restoreRootViewController:(UIViewController *)rootViewController;


@end

NS_ASSUME_NONNULL_END

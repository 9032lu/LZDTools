//
//  UIView+LZDExtension.m
//  LZDTools
//
//  Created by ZhangTu on 2019/3/5.
//

#import "UIView+LZDExtension.h"

@implementation UIView (LZDExtension)

#pragma mark - Setter

- (void)setLzdx:(CGFloat)lzdx{
    
    CGRect frame = self.frame;
    frame.origin.x = lzdx;
    self.frame = frame;
}
- (void)setLzdy:(CGFloat)lzdy{
    
    
    CGRect frame = self.frame;
    frame.origin.y = lzdy;
    self.frame = frame;
}
-(void)setLzdbottom:(CGFloat)lzdbottom{
    self.lzdy = lzdbottom - self.lzdheight;
}
-(void)setLzdright:(CGFloat)lzdright
{
    self.lzdx = lzdright - self.lzdwidth;
}
-(void)setLzdcenterX:(CGFloat)lzdcenterX
{
    CGPoint center = self.center;
    center.x = lzdcenterX;
    self.center = center;
}
-(void)setLzdcenterY:(CGFloat)lzdcenterY{
    
    CGPoint center = self.center;
    center.y = lzdcenterY;
    self.center = center;
}

-(void)setLzdorigin:(CGPoint)lzdorigin{
    
    
    CGRect frame = self.frame;
    frame.origin = lzdorigin;
    self.frame = frame;
}
-(void)setLzdwidth:(CGFloat)lzdwidth{
    CGRect frame = self.frame;
    frame.size.width = lzdwidth;
    self.frame = frame;
}
-(void)setLzdheight:(CGFloat)lzdheight{
    CGRect frame = self.frame;
    frame.size.height = lzdheight;
    self.frame = frame;
}
-(void)setLzdsize:(CGSize)lzdsize{
    CGRect frame = self.frame;
    frame.size = lzdsize;
    self.frame = frame;
}

#pragma mark - getter
-(CGFloat)lzdx{
    return self.frame.origin.x;

}


- (CGFloat)lzdy {
    return self.frame.origin.y;
}

- (CGFloat)lzdbottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)lzdright {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)lzdcenterX {
    return self.center.x;
}

- (CGFloat)lzdcenterY {
    return self.center.y;
}

- (CGPoint)lzdorigin {
    return self.frame.origin;
}

- (CGFloat)lzdwidth {
    return self.frame.size.width;
}

- (CGFloat)lzdheight {
    return self.frame.size.height;
}

- (CGSize)lzdsize {
    return self.frame.size;
}

#pragma mark - other

- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return [self getTopController];
}

- (UIViewController *)getTopController
{
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}
- (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    }else if ([rootViewController isKindOfClass:[UINavigationController class]]){
        UINavigationController *nav = (UINavigationController *)rootViewController;
        return [self topViewControllerWithRootViewController:nav.visibleViewController];
        
    }else if (rootViewController.presentedViewController){
        
        UIViewController *presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    }else{
        return  rootViewController;
    }
}

//- (UIViewController *)getTopController{
//
//    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
//
//    while (topController.presentedViewController) {
//        topController = topController.presentedViewController;
//    }
//
//    return topController;
//}

// 登陆后淡入淡出更换rootViewController
+(void)restoreRootViewController:(UIViewController *)rootViewController
{
    typedef void (^Animation)(void);
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = rootViewController;
        [UIView setAnimationsEnabled:oldState];
    };
    
    [UIView transitionWithView:window
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}


@end

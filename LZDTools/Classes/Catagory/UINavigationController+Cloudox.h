//
//  UINavigationController+Cloudox.h
//  AFNetworking
//
//  Created by 鲁征东 on 2019/9/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Cloudox)<UINavigationControllerDelegate,UINavigationBarDelegate>

@property (nonatomic,copy) NSString *cloudox;
- (void)setNeedsNavigationBackground:(CGFloat)alpha;


@end

NS_ASSUME_NONNULL_END

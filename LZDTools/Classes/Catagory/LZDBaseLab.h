//
//  LZDBaseLab.h
//  AFNetworking
//
//  Created by 鲁征东 on 2020/5/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZDBaseLab : UILabel

@property (nonatomic, assign) IBInspectable CGFloat topEdge;
@property (nonatomic, assign) IBInspectable CGFloat leftEdge;
@property (nonatomic, assign) IBInspectable CGFloat bottomEdge;
@property (nonatomic, assign) IBInspectable CGFloat rightEdge;
 /// lable文字边距

@property (nonatomic, assign) UIEdgeInsets contentEdgeInsets;


@end

NS_ASSUME_NONNULL_END

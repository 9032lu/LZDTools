//
//  LZDTool.h
//  LZDTools
//
//  Created by ZhangTu on 2019/3/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZDTool : NSObject

/**
 * 过滤value中的空值 -----引入头文件后，在需要的地方直接这样写SafeValue(你需要判断过滤的值)
 */
NSString *SafeValue(id value);


/**
 *  MD5加密, 32位 小写
 *
 *  @param str 传入要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)MD5ForLower32Bate:(NSString *)str;

@end


NS_ASSUME_NONNULL_END

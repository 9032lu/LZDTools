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

typedef void(^HttpUploadSuccessBlock)(id Json);
typedef void(^HttpUploadFailureBlock)(id json);
typedef void(^progressBlock)(id progress);

@interface Manager : NSObject

// post请求
+ (void)getDataPostWithUrl: (NSString *)url Parameters: (id)parameter Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure;
// get请求
+ (void)getDataGetWithUrl: (NSString *)url Parameters:(id)parameter Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure;
// 上传图片
+ (void)uploadImageWithUrl: (NSString *)url Parameters: (id)parameter UploadImage :(UIImage *)uploadImage Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure;
// 检测网络状态
+ (void)monitoringNetStatus: (void (^)(id))netStatus;
+ (void)uploadImageWithPath:(NSString *)path photos:(NSArray *)photos params:(NSDictionary *)params currentProgress:(progressBlock)currentProgress success:(HttpUploadSuccessBlock)success failure:(HttpUploadFailureBlock)failure;



/**
 上传语音
 
 @param url 地址
 @param parameter 参数
 @param audioPath 语音本地地址
 @param success 成功
 @param failure 失败
 */
+ (void)uploadAudioWithUrl: (NSString *)url Parameters: (id)parameter UploadAudioPath:(NSString *)audioPath Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure;

@end

NS_ASSUME_NONNULL_END

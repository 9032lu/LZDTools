//
//  NSString+LZDRegex.h
//  MyProjectBase_Example
//
//  Created by ZhangTu on 2019/3/1.
//  Copyright © 2019 timeforasong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LZDRegex)

///////////////////////////// 正则表达式相关  ///////////////////////////////

/** 邮箱验证 */
- (BOOL)isValidEmail;

/** 手机号码验证 */
- (BOOL)isValidPhoneNum;

/** 车牌号验证 */
- (BOOL)isValidCarNo;

/** 网址验证 */
- (BOOL)isValidUrl;

/** 邮政编码 */
- (BOOL)isValidPostalcode;

/** 纯汉字 */
- (BOOL)isValidChinese;



/**
 @brief     是否符合IP格式，xxx.xxx.xxx.xxx
 */
- (BOOL)isValidIP;

/** 身份证验证 refer to http://blog.csdn.net/afyzgh/article/details/16965107*/
- (BOOL)isValidIdCardNum;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     containDigtal   包含数字
 @param     containLetter   包含字母
 @param     containOtherCharacter   其他字符
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/** 去掉两端空格和换行符 */
- (NSString *)stringByTrimmingBlank;

/** 去掉html格式 */
- (NSString *)removeHtmlFormat;

/** 工商税号 */
- (BOOL)isValidTaxNo;



/**
 *
 *   BOOL 判断0-9的纯数字字符串
 *
 *  @return Yes为0-9数字，no 不是
 */

-(BOOL)isNumber;

/**
 *判断由数字和26个英文字母或下划线组成的字符串
 *
 */
-(BOOL)isNumAndword;




/**
 *  清空字符串中的空白字符
 *
 *  @return 清空空白字符串之后的字符串
 */
- (NSString *)trimString;

/**
 *  是否空字符串
 *
 *  @return 如果字符串为nil或者长度为0返回YES
 */
- (BOOL)isEmptyString;

/**
 *  返回沙盒中的文件路径
 *
 *  @return 返回当前字符串对应在沙盒中的完整文件路径
 */
+ (NSString *)stringWithDocumentsPath:(NSString *)path;

/**
 *  写入系统偏好
 *
 *  @param key 写入键值
 */
- (void)saveToNSDefaultsWithKey:(NSString *)key;



/**
 一串字符在固定宽度下，正常显示所需要的高度

 @param string 文本内容
 @param width 每一行的宽度
 @param font 字体大小
 @return 返回高度
 */
+ (CGFloat)autoHeightWithString:(NSString *)string
                          Width:(CGFloat)width
                           Font:(NSInteger)font;



/**
 一串字符在一行中正常显示所需要的宽度

 @param string 文本内容
 @param font 字体大小
 @return 返回宽度
 */
+ (CGFloat)autoWidthWithString:(NSString *)string
                          Font:(NSInteger)font;

/**
 下划线文字
 
 @param string 文字内容
 @return <#return value description#>
 */
+ (NSAttributedString *)makeDeleteLine:(NSString *)string;

//返回带换行符的字符串
+ (NSString *)StringHaveNextLine:(NSArray *)array;

+(NSString *)getTheNoNullStr:(id)str andRepalceStr:(NSString*)replace;

/**
 获取当前语言
 
 @return <#return value description#>
 */
+(NSString*)lzdGetLanguage;


#pragma mark - 拼接请求的网络地址
/**
 *  拼接请求的网络地址
 *
 *  @param urlString     基础网址
 *  @param parameters 拼接参数
 *
 *  @return 拼接完成的网址
 */

+(NSString *)urlDictToStringWithUrlStr:(NSString *)urlString WithDict:(NSDictionary *)parameters;

/**
 过滤所有表情。returnValue为NO表示不含有表情，YES表示含有表情

 @param string 字符内容
 @return <#return value description#>
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

#pragma mark 时间转换



/**
 时间戳转成时间
 
 @param time 时间戳
 @param format 格式
 @return 时间
 */
+ (NSString *)changeIntervalTime:(NSTimeInterval)time WithFormat:(NSString *)format;
/**
 时间转成指定格式时间
 
 @param time 给定时间
 @param format 目标格式
 @return 格式化后的时间
 */
+ (NSString *)changeTimeStrTim:(NSString *)time WithFormat:(NSString *)format;
/**
 转换时间格式
 
 @param time 时间
 @param formt 时间的格式
 @param format 目标格式
 @return 格式化后的时间
 */
+ (NSString *)changeStrTim:(NSString *)time ForMat:(NSString *)formt Format:(NSString *)format ;
/**
 时间转成date
 
 @param time 时间
 @param format 时间的格式
 @return date
 */
+ (NSDate *)changeStrTimToDate:(NSString *)time Format:(NSString*)format ;


/**
 传内容string和字体大小，就可以计算多少行
 
 @param str 字符串
 @param font 字体
 @param width 宽度
 @return 返还行数
 */
+(CGFloat)getLineNum:(NSString*)str withFont:(UIFont*)font labelWidth:(CGFloat)width;
/**
 今天是不是周末
 
 @return NO 不是周末
 */
+(BOOL)ToadyisWeekDay;

/**
 明天是不是周末
 
 @return NO 不是周末
 */
+(BOOL)TommoryisWeekDay;



/**
 获取设备型号然后手动转化为对应名称

 @return 手机名称
 */
+(NSString *)getDeviceName;

/// 拨打电话
/// @param phone 电话号码
+(void)CallPhone:(NSString*)phone;


/// 文字前面添加文件图标
/// @param string <#string description#>
+(NSMutableAttributedString*)attachFileImg:(NSString*)imageName MutableStringFromString:(NSString*)string;


/// 保留小数位数
/// @param price 要处理的数
/// @param position 小数点第几位
+(NSString *)notRounding:(id)price
              afterPoint:(NSInteger)position;

///去掉标签
+(NSString *)removeTheHtmlFromString:(NSString *)htmlString;

@end

NS_ASSUME_NONNULL_END

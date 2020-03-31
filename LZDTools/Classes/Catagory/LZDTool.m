//
//  LZDTool.m
//  LZDTools
//
//  Created by ZhangTu on 2019/3/6.
//

#import "LZDTool.h"
#import <CommonCrypto/CommonCrypto.h>
#import "AFNetworking.h"

@implementation LZDTool

NSString *SafeValue(id value) {
    if(!value) {
        return @"";
    }else if ([value isKindOfClass:[NSString class]]) {
        if ([value isEqualToString:@"<null>"] || [value isEqualToString:@"(null)"]) {
            return @"";
        }
        return value;
    }else {
        return [NSString stringWithFormat:@"%@",value];
    }
}


#pragma mark - 32位 小写
+(NSString *)MD5ForLower32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}
@end


@implementation Manager

static id _instance;

static AFHTTPSessionManager *manager ;
+ (AFHTTPSessionManager *)sharedHTTPSession {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain",@"var",nil];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
            AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
           [securityPolicy setAllowInvalidCertificates:YES];
           [manager setSecurityPolicy:securityPolicy];
        
        /* 请求队列最大并发数 */
        manager.operationQueue.maxConcurrentOperationCount = 5;
        /* 请求超时的时间 */
        manager.requestSerializer.timeoutInterval = 15;
    });
    return manager;
}
static AFNetworkReachabilityManager * networkManager ;
+ (AFNetworkReachabilityManager *)sharedNetworkManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        networkManager = [AFNetworkReachabilityManager manager];
        
    });
    return networkManager;
}


+ (void)getDataGetWithUrl: (NSString *)url Parameters:(id)parameter Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure {
    AFHTTPSessionManager *Manager = [self sharedHTTPSession];
    
    /* 数据请求 */
    
    [Manager GET:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+ (void)getDataPostWithUrl: (NSString *)url Parameters: (id)parameter Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure {
    AFHTTPSessionManager *Manager = [self sharedHTTPSession];
    
    NSLog(@"%@\n%@",url,parameter);
    
    [Manager POST:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            
         
            success(responseObject);
          
            
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            NSLog(@"error---%@",error);
            if ([error.localizedDescription isEqualToString:@"已取消"]){
                
                
            }else{
                
            }
            
        }
    }];
}

+ (void)uploadImageWithUrl: (NSString *)url Parameters: (id)parameter UploadImage :(UIImage *)uploadImage Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure {
    
    AFHTTPSessionManager *Manager = [self sharedHTTPSession];
    [Manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (uploadImage != nil) {
            NSData *imgData = UIImageJPEGRepresentation(uploadImage, 0.05);
            [formData appendPartWithFileData:imgData name:@"coverFile" fileName:@"png" mimeType:@"image/png"];
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)monitoringNetStatus:(void (^)(id responseObject))netStatus {
    AFNetworkReachabilityManager * manager = [self sharedNetworkManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                if (netStatus) {
                    netStatus(@"未知网络类型");
                }
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                if (netStatus) {
                    netStatus(@"无可用网络");
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                if (netStatus) {
                    netStatus(@"使用蜂窝流量");
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                if (netStatus) {
                    netStatus(@"当前WIFI下");
                }
                break;
                
            default:
                break;
        }
    }];
    [manager startMonitoring];
}
#pragma mark 上传多张图片
+ (void)uploadImageWithPath:(NSString *)path photos:(NSArray *)photos params:(NSDictionary *)params currentProgress:(progressBlock)currentProgress success:(HttpUploadSuccessBlock)success failure:(HttpUploadFailureBlock)failure
{
    
    AFHTTPSessionManager *manager = [self sharedHTTPSession];
    [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i < photos.count; i ++) {
            //            NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
            //            formatter.dateFormat=@"yyyyMMddHHmmss";
            //            NSString *str=[formatter stringFromDate:[NSDate date]];
            
            NSTimeInterval timeval = [[NSDate date]timeIntervalSince1970];
            
            NSString *fileName=[NSString stringWithFormat:@"%.0f.jpg",timeval*1000];
            UIImage *image = photos[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 1);
            //            NSLog(@"coverFile---%@  %@   %lf",[NSString stringWithFormat:@"coverFile%d",i+1],str,timeval);
            [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"coverFile%d",i+1] fileName:fileName mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        currentProgress(uploadProgress);
        NSLog(@"uploadProgress is %lld,总字节 is %lld",uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
//+ (void)cancelAllTasks{
//
//   AFHTTPSessionManager *Manager = [self sharedHTTPSession];
//
//   [Manager.tasks makeObjectsPerformSelector:@selector(cancel)];
//
//}

/**
 上传语音
 
 @param url 地址
 @param parameter 参数
 @param audioPath 语音本地地址
 @param success 成功
 @param failure 失败
 */
+ (void)uploadAudioWithUrl: (NSString *)url Parameters: (id)parameter UploadAudioPath:(NSString *)audioPath Success: (void (^) (id responseObject))success Failure: (void (^) (NSError *error))failure;
{
    AFHTTPSessionManager *Manager = [self sharedHTTPSession];
    Manager.requestSerializer.timeoutInterval = 100;
    

    
    
    [Manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (audioPath != nil) {
            NSData *audiodata = [NSData dataWithContentsOfFile:audioPath];
            
            [formData appendPartWithFileData:audiodata name:@"audioFile" fileName:@"audio.amr" mimeType:@"amr/mp3/wmr"];
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end

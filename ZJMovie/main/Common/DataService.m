//
//  DataService.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/21.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "DataService.h"
#import "AFNetworking.h"

@implementation DataService


+ (id)loadData1:(NSString *)string
{
    
    
    NSString *string1=[NSString stringWithFormat:@"https://api.douban.com/v2/movie/%@",string];
    
    //01 构建url
    NSURL *url = [NSURL URLWithString:string1];
    
    //02 构造请求
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:20];
    [request setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
    
    //03 构造connection
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    //发送同步请求
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    //04转化数据
    
    //NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    // NSLog(@"%@",string);
    // 最终获得字典 或者 数组
    
    
    
    id arrayOrDic=[NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
    
    
    
    
    
    
    return arrayOrDic;
}

+ (id)loadData:(NSString *)string
{
    
    NSString *path=[[NSBundle mainBundle] pathForResource:string ofType:nil];
    NSData *data=[NSData dataWithContentsOfFile:path];
    id arrayOrDic=[NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
    
    
    
    
    
    
    return arrayOrDic;
}

+(void)requestAFUrl:(NSString *)urlString
         httpMethod:(NSString *)method
             params:(NSMutableDictionary *)params
              datas:(NSMutableDictionary *)dicData
              block:(BlcokType)block
{
    
    
    NSString *fullUrlString=[@"https://api.douban.com/v2/movie/" stringByAppendingString:urlString];
    
    
    
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    
    
    if ([method isEqualToString:@"GET"])
    {
        
        
        
        [manager GET:fullUrlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"上传成功");
            block(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            
            NSLog(@"失败");
        }];
        
        
        
        
    }
    else if( [method isEqualToString:@"POST"])
    {
        if (dicData !=nil) {
            
            
            
            AFHTTPRequestOperation *operation=[manager POST:fullUrlString parameters:params     constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                
                
                for (NSString *name in dicData)
                {
                    NSData *data=dicData[name];
                    [formData appendPartWithFileData:data name:name fileName:@"1.png" mimeType:@"image/jpeg"];
                    
                    
                }
                
            } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSLog(@"上传成功");
                block(responseObject);
                
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"失败");
                
            }];
            
            
            //监控下载
            [operation setDownloadProgressBlock:^void(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead  ) {
                NSLog(@"下载 %li  %lld %lld",bytesRead,totalBytesRead,totalBytesExpectedToRead);
            }];
            
            //监控上传
            [operation setUploadProgressBlock:^void(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
                NSLog(@"上传 %li %lld  %lld",bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
                
            }];
            
            
        }
        else
        {
            AFHTTPRequestOperation *operation=[manager POST:fullUrlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"上传成功");
                block(responseObject);
                
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"失败");
            }];
            
            
            
            //监控下载
            [operation setDownloadProgressBlock:^void(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead  ) {
                NSLog(@"下载 %li  %lld %lld",bytesRead,totalBytesRead,totalBytesExpectedToRead);
            }];
            
            //监控上传
            [operation setUploadProgressBlock:^void(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
                NSLog(@"上传 %li %lld  %lld",bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
                
            }];
            
            
            
        }
        
    }
    
}
    
@end

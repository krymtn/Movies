

#import "APIRequest.h"
#import "AFNetworking.h"

@implementation APIRequest

static NSString *BASE_URL;

static AFHTTPSessionManager *manager;


+ (void)GET:(NSString *)URLSuffix parameters:(NSDictionary *)params completion:(APIGETRequestCompletionBlock)completion
{
    
    [[self manager] GET:[NSString stringWithFormat:@"%@/%@",BASE_URL,URLSuffix] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",[NSString stringWithFormat:@"%@/%@",BASE_URL,URLSuffix]);
        
        @try
        {
            completion(true, responseObject);
            
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception :%@",exception);
        }
        @finally
        {
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completion(false, nil);
        NSLog(@"Error %@" ,[error localizedDescription]);
    }];
}


+ (AFHTTPSessionManager *) manager
{
    if(manager == nil)
    {
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = nil;//[NSSet setWithObject:@"text/html"];
        [self serializeRequest];
    }
    
    return manager;
}

+ (void) serializeRequest
{
    AFHTTPRequestSerializer * requestSerializer = [AFHTTPRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"2" forHTTPHeaderField:@"trakt-api-version"];
    [requestSerializer setValue:@"ad005b8c117cdeee58a1bdb7089ea31386cd489b21e14b19818c91511f12a086" forHTTPHeaderField:@"trakt-api-key"];
    [self manager].requestSerializer = requestSerializer;
    
    
    NSLog(@"%@", [self manager].requestSerializer.HTTPRequestHeaders);
}


+ (void)setBaseURL: (NSString *)url
{
    if(BASE_URL != nil)
    {
        NSLog(@"%s BASE_URL is already set!", __FUNCTION__);
        return;
    }
    
    BASE_URL = url;
}


@end

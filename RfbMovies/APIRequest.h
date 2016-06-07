

#import <Foundation/Foundation.h>

@interface APIRequest : NSObject

typedef enum
{
    APIRequestMethodPost = 0,
    APIRequestMethodGet,
    
} APIRequestMethod;

typedef BOOL (^APIAlertMessageBlock)(NSInteger code, NSString *message);
typedef void (^APIGETRequestCompletionBlock) (bool success, NSDictionary *response);

+ (void) setBaseURL: (NSString *) url;

+ (AFHTTPSessionManager *) manager;

+ (void) GET :(NSString *) URLSuffix parameters:(NSDictionary *) params completion:(APIGETRequestCompletionBlock)  completion;


@end

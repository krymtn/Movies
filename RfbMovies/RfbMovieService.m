//
//  RfbMovieService.m
//  RfbMovies
//
//  Created by Koray Metin on 09/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import "RfbMovieService.h"
#import "JMPopularMovie.h"
#import "JMSearchMovie.h"

#define LIMIT @"10"

@implementation RfbMovieService

+ (instancetype)sharedInstance{
    
    static RfbMovieService *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[RfbMovieService alloc] init];
    });
    
    return instance;
}

- (void)getPopularMoviesWithPageNumber:(NSInteger)page withCompletion:(MovieCompletionBlock)completion
{
    NSDictionary *params = @{
                             @"limit":LIMIT,
                             @"page":[NSString stringWithFormat:@"%ld",(long)page],
                             @"extended":@"images"
                             };
    
    [APIRequest GET:@"movies/popular" parameters:params completion:^(bool success, NSDictionary *response) {
        if (success)
        {
            
           /**
            *  Need to assing an objectname in array, JSONModel works in that way only.
            */
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setObject:response forKey:@"movies"];
            
           /**
            *  Parsing with JSONModel help, Classes as you see in Models class
            */
            NSMutableArray *tempArr = [[NSMutableArray alloc] init];
            tempArr = [JMPopularMovie arrayOfModelsFromDictionaries:dict[@"movies"] error:nil];
            
            completion(true,tempArr);
        }
    }];
}


- (void)getSearchResults:(NSString*)query withSearchPage:(NSInteger)page withComletion:(MovieCompletionBlock)completion
{
    NSDictionary *params = @{
                             @"limit":LIMIT,
                             @"page":[NSString stringWithFormat:@"%ld",(long)page],
                             @"query":query,
                             @"type":@"movie"
                             };
    
    NSLog(@"Search Params %@",params);
    
    [APIRequest GET:@"search" parameters:params completion:^(bool success, NSDictionary *response) {
        if (success)
        {

            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            [dict setObject:response forKey:@"results"];
            
            NSMutableArray *tempArr = [[NSMutableArray alloc] init];
            tempArr = [JMSearchMovie arrayOfModelsFromDictionaries:dict[@"results"] error:nil];
            
            NSLog(@"TempArr %lu",(unsigned long)tempArr.count);
        
            completion(true,tempArr);
            
        }
    }];

}



@end

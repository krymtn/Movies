//
//  RfbMovieService.h
//  RfbMovies
//
//  Created by Koray Metin on 09/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MovieCompletionBlock) (bool success, NSMutableArray *moviesArr);

@interface RfbMovieService : NSObject

+ (instancetype)sharedInstance;

- (void)getPopularMoviesWithPageNumber:(NSInteger)page withCompletion:(MovieCompletionBlock)completion;
- (void)getSearchResults:(NSString*)query withSearchPage:(NSInteger)page withComletion:(MovieCompletionBlock)completion;


@end

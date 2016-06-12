//
//  JMMovieIDs.h
//  RfbMovies
//
//  Created by Koray Metin on 07/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol JMMovieIDs @end

@interface JMMovieIDs : JSONModel

@property(nonatomic,strong) NSString *imdb;
@property(nonatomic,strong) NSString *slug;
@property(nonatomic,strong) NSString *tmdb;
@property(nonatomic,strong) NSString *trakt;

@end

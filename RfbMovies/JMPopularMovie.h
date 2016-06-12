//
//  JMPopularMovie.h
//  RfbMovies
//
//  Created by Koray Metin on 07/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "JMMovieIDs.h"
#import "JMMovieImage.h"

@protocol JMPopularMovie @end

@interface JMPopularMovie : JSONModel

@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *year;
@property(nonatomic,strong) JMMovieIDs *ids;
@property(nonatomic,strong) JMMovieImage <Optional>*images;

@end

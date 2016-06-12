//
//  JMMovieImage.h
//  RfbMovies
//
//  Created by Koray Metin on 07/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "JMMoviePoster.h"

@protocol JMMovieImage @end

@interface JMMovieImage : JSONModel

@property(nonatomic,strong) JMMoviePoster <Optional>*poster;

@end

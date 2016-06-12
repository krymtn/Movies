//
//  JMSearchMovie.h
//  RfbMovies
//
//  Created by Koray Metin on 12/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "JMPopularMovie.h"

@interface JMSearchMovie : JSONModel

@property(nonatomic,strong) JMPopularMovie *movie;
@property(nonatomic,strong) NSString *score;
@property(nonatomic,strong) NSString *type;

@end

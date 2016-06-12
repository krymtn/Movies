//
//  JMMoviePoster.h
//  RfbMovies
//
//  Created by Koray Metin on 07/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol JMMoviePoster @end

@interface JMMoviePoster : JSONModel

@property(nonatomic,strong) NSString <Optional>*full;
@property(nonatomic,strong) NSString <Optional>*medium;
@property(nonatomic,strong) NSString <Optional>*thumb;

@end

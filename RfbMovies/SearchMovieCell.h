//
//  SearchMovieCell.h
//  RfbMovies
//
//  Created by Koray Metin on 12/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMSearchMovie.h"

@interface SearchMovieCell : UITableViewCell

@property(nonatomic,weak) IBOutlet RfbRegularLabel *lblTitle;
@property(nonatomic,weak) IBOutlet RfbBoldLabel *lblYear;


@property(nonatomic,strong) JMSearchMovie *searchMovie;
@end

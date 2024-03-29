//
//  SearchMovieCell.m
//  RfbMovies
//
//  Created by Koray Metin on 12/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import "SearchMovieCell.h"

@implementation SearchMovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSearchMovie:(JMSearchMovie *)searchMovie
{
    self.lblTitle.text = searchMovie.movie.title;
    self.lblYear.text  = searchMovie.movie.year;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

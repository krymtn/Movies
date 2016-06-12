//
//  MovieCell.m
//  RfbMovies
//
//  Created by Koray Metin on 08/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setPopularMovie:(JMPopularMovie *)popularMovie
{
    self.lblTitle.text = popularMovie.title;
    self.lblYear.text  = popularMovie.year;
    
    NSURL *posterURL = [NSURL URLWithString:popularMovie.images.poster.thumb];
    [self.imgPoster sd_setImageWithURL:posterURL placeholderImage:[UIImage imageNamed:@""]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

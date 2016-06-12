//
//  MovieCell.h
//  RfbMovies
//
//  Created by Koray Metin on 08/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMPopularMovie.h"

@interface MovieCell : UITableViewCell

@property(nonatomic,weak) IBOutlet UIImageView *imgPoster;
@property(nonatomic,weak) IBOutlet RfbRegularLabel *lblTitle;
@property(nonatomic,weak) IBOutlet RfbBoldLabel *lblYear;

@property(nonatomic,strong) JMPopularMovie *popularMovie;

@end

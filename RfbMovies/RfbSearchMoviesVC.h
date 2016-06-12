//
//  RfbSearchMoviesVC.h
//  RfbMovies
//
//  Created by Koray Metin on 12/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RfbSearchMoviesVC : UIViewController

- (void)searchMovies:(NSString*)query withSearchPage:(NSInteger)page isPaging:(bool)paging;
@end

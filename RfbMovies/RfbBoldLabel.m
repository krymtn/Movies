//
//  RfbBoldLabel.m
//  RfbMovies
//
//  Created by Koray Metin on 08/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import "RfbBoldLabel.h"

@implementation RfbBoldLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    [super awakeFromNib];
    self.font = [UIFont helveticaBoldWithSize:self.font.pointSize];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


@end

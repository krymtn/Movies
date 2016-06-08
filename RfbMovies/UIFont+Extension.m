//
//  UIFont+Extension.m
//  ESHOT
//
//  Created by Koray Metin on 23/03/15.
//  Copyright (c) 2015 Manggis. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)

+ (UIFont*)helveticaRegularWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
    
}

+ (UIFont*)helveticaThinWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Thin" size:size];
}

+ (UIFont*)helveticaBoldWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:size];
}


@end

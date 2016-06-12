//
//  UIFont+Extension.m


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

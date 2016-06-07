//
//  NSString+Extension.m
//  ESHOT
//
//  Created by Koray Metin on 24/03/15.
//  Copyright (c) 2015 Manggis. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSDictionary*)jsonDictionary
{
    NSError *jsonError;
    NSData *objectData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];
    
    return json;
}

- (NSDate*)dateWithFormat:(NSString*)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    
    NSDate *date = [dateFormatter dateFromString:self];
    
    return date;
}

- (NSString *)zst_regexForTurkishLettersWithCaseSensitive:(BOOL)caseSensitive
{
    NSMutableString *filterWordRegex = [NSMutableString string];
    for (NSUInteger i = 0; i < self.length; i++) {
        NSString *letter = [self substringWithRange:NSMakeRange(i, 1)];
        if (caseSensitive) {
            if ([letter isEqualToString:@"ı"] || [letter isEqualToString:@"i"]) {
                letter = @"[ıi]";
            } else if ([letter isEqualToString:@"I"] || [letter isEqualToString:@"İ"]) {
                letter = @"[Iİ]";
            }
        } else {
            if ([letter isEqualToString:@"ı"] || [letter isEqualToString:@"i"] ||
                [letter isEqualToString:@"I"] || [letter isEqualToString:@"İ"]) {
                letter = @"[ıiIİ]";
            }
        }
        [filterWordRegex appendString:letter];
    }
    return filterWordRegex;
}

- (NSString*)extractYoutubeIdFromLink {
    
    NSString *regexString = @"((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)";
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:regexString
                                                                            options:NSRegularExpressionCaseInsensitive
                                                                              error:nil];
    
    NSArray *array = [regExp matchesInString:self options:0 range:NSMakeRange(0,self.length)];
    if (array.count > 0) {
        NSTextCheckingResult *result = array.firstObject;
        return [self substringWithRange:result.range];
    }
    return nil;
}


@end

//
//  NSString+Extension.h
//  ESHOT
//
//  Created by Koray Metin on 24/03/15.
//  Copyright (c) 2015 Manggis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (NSDictionary*)jsonDictionary;

- (NSDate*)dateWithFormat:(NSString*)format;

- (NSString *)urlencode;

@end

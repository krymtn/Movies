//
//  Constants.h
//  Ximmio
//
//  Created by Koray Metin on 29/01/16.
//  Copyright © 2016 2GO-Mobile. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define SCREENWIDTH  [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height

#define STANDARTCORNERRADIUS 0.f
#define APP_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]

#define DEV_API_URL @"https://api-v2launch.trakt.tv"

#endif /* Constants_h */

//
//  NSObject+NSDictionaryRepresentation.m
//  BuseTerim
//
//  Created by Gökhan Gültekin on 10/03/14.
//  Copyright (c) 2014 Manggis. All rights reserved.
//

#import "NSObject+NSDictionaryRepresentation.h"
#import <objc/runtime.h>

@implementation NSObject (NSDictionaryRepresentation)

- (NSDictionary *)dictionaryRepresentation{

    NSMutableArray *propertyKeys = [NSMutableArray array];
    Class currentClass = self.class;
    
    while ([currentClass superclass]) { // avoid printing NSObject's attributes
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(currentClass, &outCount);
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            const char *propName = property_getName(property);
            if (propName) {
                NSString *propertyName = [NSString stringWithUTF8String:propName];
                [propertyKeys addObject:propertyName];
            }
        }
        free(properties);
        currentClass = [currentClass superclass];
    }
    
    return [self dictionaryWithValuesForKeys:propertyKeys];
}

@end

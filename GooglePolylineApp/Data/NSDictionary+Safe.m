//
//  NSDictionary+Safe.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 17/12/15.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)

- (id)safeObjectForKey:(NSString *)key {
    
    id object = [self objectForKey:key];
    if (object == [NSNull null]) {
        return nil;
    } else {
        return object;
    }
}

@end

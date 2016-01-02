//
//  NSDictionary+Safe.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 17/12/15.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

- (id)safeObjectForKey:(NSString *)key;

@end

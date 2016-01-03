//
//  NSDate+Converter.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 03/01/16.
//  Copyright © 2016 Lukas Oslislo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Converter)

+ (NSString *)formatStringFromDate:(NSDate *)date;
+ (NSDate *)formatDateFromString:(NSString *)string;

@end

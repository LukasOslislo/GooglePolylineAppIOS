//
//  NSDate+Converter.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 03/01/16.
//  Copyright © 2016 Lukas Oslislo. All rights reserved.
//

#import "NSDate+Converter.h"

@implementation NSDate (Converter)

+ (NSDate *)formatDateFromString:(NSString *)string {
    // Date format used:
    // 2015-09-24T00:00:00+01:00
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
    
    NSDate *date = [dateFormatter dateFromString:string];
    
    return date;
}

/**
 *  Returns a short formatted string represenation of a date
 *
 *  @param date the date
 *
 *  @return returns a short string with the date's contents
 */
+ (NSString *)formatStringFromDate:(NSDate *)date {
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM"];
    
    NSString* formattedString = [formatter stringFromDate:date];
    
    return formattedString;
}

@end

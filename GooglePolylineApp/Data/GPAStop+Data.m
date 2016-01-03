//
//  GPAStop+Data.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 02/01/16.
//  Copyright © 2016 Lukas Oslislo. All rights reserved.
//

#import "GPAStop+Data.h"
#import "GPACoordinate.h"
#import "NSDictionary+Safe.h"
#import "NSDate+Converter.h"

@interface GPAStop ()

@property (strong, nonatomic, readwrite) GPACoordinate *coordinate;
@property (strong, nonatomic, readwrite) NSDate *dateTime;
@property (strong, nonatomic, readwrite) NSString *stopName;

@end

@implementation GPAStop (Data)

+ (GPAStop *)stopWithData:(NSDictionary *)data {
    GPAStop *stop = [[GPAStop alloc] init];
    GPACoordinate *coordinate = [[GPACoordinate alloc]init];
    NSNumber *lat = [data safeObjectForKey:@"lat"];
    NSNumber *lng = [data safeObjectForKey:@"lng"];
    coordinate.latitude = lat.doubleValue;
    coordinate.longitude = lng.doubleValue;
    stop.coordinate = coordinate;
    stop.stopName = [data safeObjectForKey:@"name"];
    stop.dateTime = [NSDate formatDateFromString:[data safeObjectForKey:@"datetime"]];
    
    return stop;
}

@end

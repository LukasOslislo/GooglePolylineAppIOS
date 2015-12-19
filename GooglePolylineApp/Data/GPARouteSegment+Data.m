//
//  GPARouteSegment+Data.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 16/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "GPARouteSegment+Data.h"
#import "GPACoordinate.h"
#import "GPAPolylineEncoding.h"

#import "NSDictionary+Safe.h"

@interface GPARouteSegment (Private)

@property (nonatomic, strong, readwrite) NSArray<GPACoordinate *> *coordinates;
@property (nonatomic, strong, readwrite) NSString *color;

@end

@implementation GPARouteSegment (Data)

+ (GPARouteSegment *)segmentWithData:(NSDictionary *)data {
    GPARouteSegment *routeSegment = [[GPARouteSegment alloc]init];
    routeSegment.coordinates = [GPARouteSegment rawDataToCoordinates: [data safeObjectForKey:@"polyline"]];
    routeSegment.color = [data safeObjectForKey:@"color"];
    
    return routeSegment;
}

+(NSArray *)rawDataToCoordinates:(NSString *)rawData {
    
    NSArray *polylineElements = [GPAPolylineEncoding decodePolyline:rawData];
    
    if (!polylineElements || polylineElements.count < 2 || polylineElements.count % 2) {
        return nil;
    }
    
    NSMutableArray *coordinates = [[NSMutableArray alloc]init];
    
    for (int i = 2; i < polylineElements.count; i+=2) {
        
        NSNumber *lat = polylineElements[i];
        NSNumber *lon = polylineElements[i-1];
        
        GPACoordinate *coordinate = [[GPACoordinate alloc]initWithLatitude:lat.doubleValue andLongitude:lon.doubleValue];
        [coordinates addObject:coordinate];
    }
    
    return coordinates;
}

@end

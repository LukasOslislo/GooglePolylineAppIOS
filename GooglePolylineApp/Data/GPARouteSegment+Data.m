//
//  GPARouteSegment+Data.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 16/12/15.
//

#import "GPARouteSegment+Data.h"
#import "GPAStop+Data.h"
#import "GPACoordinate.h"
#import "GPAPolylineEncoding.h"

#import "NSDictionary+Safe.h"

@interface GPARouteSegment (Private)

@property (nonatomic, strong, readwrite) NSArray<GPACoordinate *> *coordinates;
@property (nonatomic, strong, readwrite) NSArray<GPAStop *> *stops;
@property (nonatomic, strong, readwrite) NSString *color;
@property (nonatomic, strong, readwrite) NSString *segmentName;
@property (nonatomic, strong, readwrite) NSString *travelMode;
@property (nonatomic, strong, readwrite) NSString *segmentDescription;


@end

@implementation GPARouteSegment (Data)

+ (GPARouteSegment *)segmentWithData:(NSDictionary *)data {
    GPARouteSegment *routeSegment = [[GPARouteSegment alloc]init];
    routeSegment.coordinates = [GPARouteSegment dataToCoordinates: [data safeObjectForKey:@"polyline"]];
    routeSegment.stops = [GPARouteSegment dataToStops: [data safeObjectForKey:@"stops"]];
    routeSegment.color = [data safeObjectForKey:@"color"];
    routeSegment.segmentName = [data safeObjectForKey:@"name"];
    routeSegment.travelMode = [data safeObjectForKey:@"travel_mode"];
    routeSegment.segmentDescription = [data safeObjectForKey:@"description"];
    
    return routeSegment;
}

+(NSArray<GPAStop *> *)dataToStops:(NSArray *)data {
    NSMutableArray<GPAStop *> *stops = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in data) {
        GPAStop *stop = [GPAStop stopWithData:dict];
        [stops addObject:stop];
    }
    
    return stops;
}

+(NSArray<GPACoordinate *> *)dataToCoordinates:(NSString *)data {
    
    NSArray *polylineElements = [GPAPolylineEncoding decodePolyline:data];
    
    if (!polylineElements || polylineElements.count < 2 || polylineElements.count % 2) {
        return nil;
    }
    
    NSMutableArray *coordinates = [[NSMutableArray alloc]init];
    
    for (int i = 2; i < polylineElements.count; i+=2) {
        
        NSNumber *lat = polylineElements[i-2];
        NSNumber *lon = polylineElements[i-1];
        
        GPACoordinate *coordinate = [[GPACoordinate alloc]initWithLatitude:lat.doubleValue andLongitude:lon.doubleValue];
        [coordinates addObject:coordinate];
    }
    
    return coordinates;
}

@end

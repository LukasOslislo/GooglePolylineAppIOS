//
//  GPABoundingBox.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 21/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "GPABoundingBox.h"
#import "GPARoute.h"
#import "GPARouteSegment.h"
#import "GPACoordinate.h"

@interface GPABoundingBox ()

@property (nonatomic, strong, readwrite) GPACoordinate *topLeft;
@property (nonatomic, strong, readwrite) GPACoordinate *bottomRight;

@end

@implementation GPABoundingBox

+ (GPABoundingBox *)boundingBoxWithRoute: (GPARoute *)route {
    
    if (!route || route.segments.count == 0) {
        return nil;
    }
    
    GPACoordinate *minCoordinate = nil;
    GPACoordinate *maxCoordinate = nil;
    
    for (int j = 0; j < route.segments.count; j++) {
        GPARouteSegment *segment = route.segments[j];
        
        for (int i = 0; i < segment.coordinates.count; i++) {
            GPACoordinate *coordinate = segment.coordinates[i];
            
            if (!minCoordinate && !maxCoordinate){
                minCoordinate = [coordinate copy];
                maxCoordinate = [coordinate copy];
            } else {
                minCoordinate.latitude = minCoordinate.latitude < coordinate.latitude ? minCoordinate.latitude : coordinate.latitude;
                minCoordinate.longitude = minCoordinate.longitude < coordinate.longitude ? minCoordinate.longitude : coordinate.longitude;
                
                maxCoordinate.latitude = maxCoordinate.latitude > coordinate.latitude ? maxCoordinate.latitude : coordinate.latitude;
                maxCoordinate.longitude = maxCoordinate.longitude > coordinate.longitude ? maxCoordinate.longitude : coordinate.longitude;
            }
        }
    }
    
    GPABoundingBox *boundingBox = [[GPABoundingBox alloc] init];
    boundingBox.topLeft = minCoordinate;
    boundingBox.bottomRight = maxCoordinate;
    
    return boundingBox;
}

@end

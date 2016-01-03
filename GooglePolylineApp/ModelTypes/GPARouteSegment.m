//
//  GPARouteSegment.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//

#import "GPARouteSegment.h"
#import <CoreLocation/CoreLocation.h>
#import "GPACoordinate.h"

@interface GPARouteSegment ()

@property (nonatomic, strong, readwrite) NSArray<GPACoordinate *> *coordinates;
@property (nonatomic, strong, readwrite) NSArray<GPAStop *> *stops;
@property (nonatomic, strong, readwrite) NSString *color;
@property (nonatomic, strong, readwrite) NSString *segmentName;
@property (nonatomic, strong, readwrite) NSString *travelMode;
@property (nonatomic, strong, readwrite) NSString *segmentDescription;

@end

@implementation GPARouteSegment

@end

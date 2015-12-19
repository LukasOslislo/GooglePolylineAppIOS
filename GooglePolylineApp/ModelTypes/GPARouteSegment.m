//
//  GPARouteSegment.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "GPARouteSegment.h"
#import <CoreLocation/CoreLocation.h>
#import "GPACoordinate.h"

@interface GPARouteSegment ()

@property (nonatomic, strong, readwrite) NSArray<GPACoordinate *> *coordinates;
@property (nonatomic, strong, readwrite) NSString *color;

@end

@implementation GPARouteSegment

@end

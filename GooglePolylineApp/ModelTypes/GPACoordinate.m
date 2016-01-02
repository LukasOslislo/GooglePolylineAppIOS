//
//  GPACoordinate.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "GPACoordinate.h"

@implementation GPACoordinate

- (instancetype)initWithLatitude:(double)lat andLongitude:(double)lon {
    if ((self = [super init])) {
        _latitude = lat;
        _longitude = lon;
    }
    return self;
}

- (GPACoordinate *)copy {
    GPACoordinate *copied = [[GPACoordinate alloc]initWithLatitude:self.latitude andLongitude:self.longitude];
    return copied;
}

@end

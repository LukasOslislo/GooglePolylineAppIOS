//
//  GPACoordinate+Converter.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 02/01/16.
//  Copyright © 2016 Lukas Oslislo. All rights reserved.
//

#import "GPACoordinate+Converter.h"

@implementation GPACoordinate (Converter)

-(CLLocationCoordinate2D) location {
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    return location;
}

@end

//
//  GPACoordinate+Converter.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 02/01/16.
//

#import "GPACoordinate+Converter.h"

@implementation GPACoordinate (Converter)

-(CLLocationCoordinate2D) location {
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    return location;
}

@end

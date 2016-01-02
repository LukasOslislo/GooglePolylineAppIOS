//
//  GPACoordinate+Converter.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 02/01/16.
//  Copyright © 2016 Lukas Oslislo. All rights reserved.
//

#import "GPACoordinate.h"
#import <MapKit/MapKit.h>

@interface GPACoordinate (Converter)

@property (readonly)CLLocationCoordinate2D location;

@end

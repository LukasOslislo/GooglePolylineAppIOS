//
//  GPACoordinate+Converter.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 02/01/16.
//

#import "GPACoordinate.h"
#import <MapKit/MapKit.h>

@interface GPACoordinate (Converter)

/**
 *  The CLLocationCoordinate2D location for this coordinate
 */
@property (readonly)CLLocationCoordinate2D location;

@end

//
//  GPACoordinate.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPACoordinate : NSObject

@property (readonly) double latitude;
@property (readonly) double longitude;

- (instancetype)initWithLatitude:(double)lat andLongitude:(double)lon;

@end

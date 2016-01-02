//
//  GPACoordinate.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPACoordinate : NSObject

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;

- (instancetype)initWithLatitude:(double)lat andLongitude:(double)lon;

@end

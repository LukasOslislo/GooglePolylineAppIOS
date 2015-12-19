//
//  GPARoute.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GPACoordinate;

@interface GPARouteSegment : NSObject

@property (nonatomic, strong, readonly) NSArray<GPACoordinate *> *coordinates;
@property (nonatomic, strong, readonly) NSString *color;

@end

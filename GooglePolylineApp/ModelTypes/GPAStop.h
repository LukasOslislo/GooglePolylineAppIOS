//
//  GPAStop.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 02/01/16.
//  Copyright © 2016 Lukas Oslislo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GPACoordinate;

@interface GPAStop : NSObject

@property (strong, nonatomic, readonly) GPACoordinate *coordinate;
@property (strong, nonatomic, readonly) NSDate *dateTime;
@property (strong, nonatomic, readonly) NSString *stopName;

@end

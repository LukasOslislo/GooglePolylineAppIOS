//
//  GPARoute.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//

#import <Foundation/Foundation.h>

@class GPACoordinate;

/**
 *  The segment of a GPARoute.
 */
@interface GPARouteSegment : NSObject

@property (nonatomic, strong, readonly) NSArray<GPACoordinate *> *coordinates;
@property (nonatomic, strong, readonly) NSString *color;
@property (nonatomic, strong, readonly) NSString *segmentName;
@property (nonatomic, strong, readonly) NSString *travelMode;

@end

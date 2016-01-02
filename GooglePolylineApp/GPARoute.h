//
//  GPARoute.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GPAProvider;
@class GPARouteSegment;
@class GPABoundingBox;

typedef enum {
    GPARouteTypePT,
    GPARouteTypeCarSharing,
    GPARouteTypePrivateBike,
    GPARouteTypeBikeSharing,
    GPARouteTypeTaxi
} GPARouteType;


@interface GPARoute : NSObject

@property (nonatomic, readonly) GPARouteType type;
@property (nonatomic, strong, readonly) GPAProvider * provider;
@property (nonatomic, strong, readonly) NSArray<GPARouteSegment *> * segments;
@property (nonatomic, strong, readonly) NSString * price;
@property (nonatomic, strong, readonly) GPABoundingBox *boundingBox;

@end

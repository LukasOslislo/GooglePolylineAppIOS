//
//  GPARoute.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
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

@property (nonatomic, readonly) GPARouteType routeType;
@property (nonatomic, strong, readonly) GPAProvider * provider;
@property (nonatomic, strong, readonly) NSArray<GPARouteSegment *> * segments;
@property (nonatomic, strong, readonly) NSString * price;

+ (NSString *)stringFromRouteType:(GPARouteType)routeType;

@end

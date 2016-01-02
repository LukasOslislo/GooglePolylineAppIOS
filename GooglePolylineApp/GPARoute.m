//
//  GPARoute.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//

#import "GPARoute.h"

static NSString* const routeTypePT = @"Public Transport";
static NSString* const routeTypeCarSharing = @"Car Sharing";
static NSString* const routeTypeBike = @"Bike";
static NSString* const routeTypeBikeSharing = @"Public Transport";
static NSString* const routeTypeTaxi = @"Taxi";

@interface GPARoute ()

@property (nonatomic, strong, readwrite) GPAProvider * provider;
@property (nonatomic, readwrite) GPARouteType routeType;
@property (nonatomic, strong, readwrite) NSArray<GPARouteSegment *> * segments;
@property (nonatomic, readwrite) NSString * price;

@end

@implementation GPARoute

+ (NSString *)stringFromRouteType:(GPARouteType)routeType {

    NSString *typeString = nil;
    
    switch (routeType) {
        case GPARouteTypePT:
            typeString = routeTypePT;
            break;
            
        case GPARouteTypeCarSharing:
            typeString = routeTypeCarSharing;
            break;
            
        case GPARouteTypePrivateBike:
            typeString = routeTypeBike;
            break;
            
        case GPARouteTypeBikeSharing:
            typeString = routeTypeBikeSharing;
            break;
            
        case GPARouteTypeTaxi:
            typeString = routeTypeTaxi;
            break;
    }
    
    return typeString;
}

@end

//
//  GPARoute.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//

#import "GPARoute.h"

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
            typeString = @"Public Transport";
            break;
            
        case GPARouteTypeCarSharing:
            typeString = @"Car Sharing";
            break;
            
        case GPARouteTypePrivateBike:
            typeString = @"Bike";
            break;
            
        case GPARouteTypeBikeSharing:
            typeString = @"Bike Sharing";
            break;
            
        case GPARouteTypeTaxi:
            typeString = @"Taxi";
            break;
    }
    
    return typeString;
}

@end

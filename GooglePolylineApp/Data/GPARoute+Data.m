//
//  GPARoute+Data.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//

#import "GPARoute+Data.h"
#import "GPARouteSegment+Data.h"
#import "GPAProvider+Data.h"

#import "GPAPolylineEncoding.h"

#import "NSDictionary+Safe.h"

@interface GPARoute ()

@property (nonatomic, strong, readwrite) GPAProvider * provider;
@property (nonatomic, readwrite) GPARouteType routeType;
@property (nonatomic, strong, readwrite) NSArray<GPARouteSegment *> * segments;
@property (nonatomic, readwrite) NSString * price;

@end

@implementation GPARoute (Data)

+ (GPARoute *)routeWithRouteData:(NSDictionary *)routeData andProviders:(NSDictionary *)providersData {
    GPARoute *route = [[GPARoute alloc]init];
    
    
    route.provider = [GPAProvider providerWithKey:[routeData safeObjectForKey:@"provider"] andProvidersData:providersData];
    route.routeType = [GPARoute typeFromString:[routeData safeObjectForKey:@"type"]];
    route.segments = [GPARoute segmentsFromData:[routeData safeObjectForKey:@"segments"]];
    
    NSDictionary *priceData = [routeData safeObjectForKey:@"price"];
    NSNumber *priceNumber = [priceData safeObjectForKey:@"amount"];
    NSString *priceCurrency = [priceData safeObjectForKey:@"currency"];
    
    if (priceNumber && priceCurrency) {
    
        //todo: implement valid price formats for all used currencies. The best way would be to use NSNuberFormatter.
        NSString *formattedPriceAmount = [NSString stringWithFormat:@"%.02f", priceNumber.floatValue / 100];
        
        NSString *formattedPrice = nil;
        formattedPrice = [NSString stringWithFormat: @"%@ %@", formattedPriceAmount, priceCurrency];
        
        route.price = formattedPrice;
    }
    
    return route;
}

+ (NSArray *)segmentsFromData:(NSArray *)data {
    NSMutableArray *segments = [[NSMutableArray alloc] init];
    
    for (NSDictionary *segmentData in data) {
        GPARouteSegment *segment = [GPARouteSegment segmentWithData:segmentData];
        [segments addObject:segment];
    }
    
    return segments;
}

+ (GPARouteType)typeFromString:(NSString *)string {
    NSDictionary *types = @{@"public_transport" : @(GPARouteTypePT),
                            @"car_sharing" : @(GPARouteTypeCarSharing),
                            @"private_bike" : @(GPARouteTypePrivateBike),
                            @"bike_sharing" : @(GPARouteTypeBikeSharing),
                            @"taxi" : @(GPARouteTypeTaxi)};
    
    NSNumber *typeNumber = [types safeObjectForKey:string];
    GPARouteType type = typeNumber.intValue;
    
    return type;
}

@end

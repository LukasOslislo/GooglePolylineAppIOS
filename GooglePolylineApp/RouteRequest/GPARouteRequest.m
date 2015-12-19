//
//  GPARouteRequest.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 13/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "GPARouteRequest.h"
#import "GPARoute+Data.h"

@implementation GPARouteRequest

-(void)fetchRoutesWithCallback:(void(^)(NSArray <GPARoute *>*result))callback {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray *routesData = [jsonData objectForKey:@"routes"];
    NSDictionary *providersData = [jsonData objectForKey:@"provider_attributes"];
    
    NSMutableArray *routes = [[NSMutableArray alloc]init];
    
    for (NSDictionary *routeData in routesData) {
        GPARoute *route = [GPARoute routeWithRouteData:routeData andProviders:providersData];
        [routes addObject:route];
    }
    
    callback(routes);
}

@end

//
//  GPARoute+Data.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//

#import "GPARoute.h"

@interface GPARoute (Data)

+ (GPARoute *)routeWithRouteData:(NSDictionary *)routeData andProviders:(NSDictionary *)providersData;

@end

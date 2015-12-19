//
//  GPARoute+Data.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "GPARoute.h"

@interface GPARoute (Data)

+ (GPARoute *)routeWithRouteData:(NSDictionary *)routeData andProviders:(NSDictionary *)providersData;

@end

//
//  GPARoute.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 15/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "GPARoute.h"

@interface GPARoute ()

@property (nonatomic, strong, readwrite) GPAProvider * provider;
@property (nonatomic, readwrite) GPARouteType type;
@property (nonatomic, strong, readwrite) NSArray<GPARouteSegment *> * segments;
@property (nonatomic, readwrite) NSString * price;

@end

@implementation GPARoute

@end

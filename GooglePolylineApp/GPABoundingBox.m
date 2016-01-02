//
//  GPABoundingBox.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 21/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "GPABoundingBox.h"
#import "GPARoute.h"

@interface GPABoundingBox ()

@property (nonatomic, strong, readwrite) GPACoordinate *topLeft;
@property (nonatomic, strong, readwrite) GPACoordinate *bottomRight;

@end

@implementation GPABoundingBox

- (instancetype)initWithRoute: (GPARoute *)route {
    if (self = [super init]) {
//        _topLeft = top
    }
    
    return self;
}

+ (GPABoundingBox *)boundingBoxFromRoute: (GPARoute *)route {
    
    GPACoordinate *topLeft;
    GPACoordinate *bottomRight;
    
}

@end

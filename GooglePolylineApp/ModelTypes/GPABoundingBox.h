//
//  GPABoundingBox.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 21/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GPARoute;
@class GPACoordinate;

@interface GPABoundingBox : NSObject

@property (nonatomic, strong, readonly) GPACoordinate *topLeft;
@property (nonatomic, strong, readonly) GPACoordinate *bottomRight;

+ (GPABoundingBox *)boundingBoxWithRoute: (GPARoute *)route;

@end

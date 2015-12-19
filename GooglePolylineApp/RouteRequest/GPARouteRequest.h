//
//  GPARouteRequest.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 13/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPARoute.h"

@interface GPARouteRequest : NSObject

-(void)fetchRoutesWithCallback:(void(^)(NSArray <GPARoute *>*result))callback;


@end

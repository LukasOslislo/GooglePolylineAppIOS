//
//  GPARouteRequest.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 13/12/15.
//

#import <Foundation/Foundation.h>
#import "GPARoute.h"

@interface GPARouteRequest : NSObject

-(void)fetchRoutesWithCallback:(void(^)(NSArray <GPARoute *>*result))callback;


@end

//
//  UIImage+RouteType.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 03/01/16.
//

#import "UIImage+RouteType.h"

@implementation UIImage (RouteType)

+(UIImage *)imageFromRouteType:(GPARouteType)type {
    
    NSString *imageName;
    
    switch (type) {
        case GPARouteTypeBikeSharing:
            imageName = @"bike_sharing";
            break;
            
        case GPARouteTypePrivateBike:
            imageName = @"cycling";
            break;
            
        case GPARouteTypeTaxi:
            imageName = @"taxi";
            break;
            
        case GPARouteTypePT:
            imageName = @"bus";
            break;
            
        case GPARouteTypeCarSharing:
            imageName = @"driving";
            break;
            
        default:
            imageName = @"driving";
            break;
    }
    
    UIImage *img = [UIImage imageNamed:imageName];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return img;
}

@end

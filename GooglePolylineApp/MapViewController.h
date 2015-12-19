//
//  MapViewController.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 13/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPARoute.h"

@interface MapViewController : UIViewController

@property (nonatomic, strong)GPARoute *route;

@end

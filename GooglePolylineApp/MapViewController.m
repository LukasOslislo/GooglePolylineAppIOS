//
//  MapViewController.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 13/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "GPARouteSegment.h"
#import "GPACoordinate.h"

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) NSMutableArray<MKPolylineRenderer *>* polylineRenderers;

@end

@implementation MapViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView.delegate = self;
    
    [self drawRoute];
}

- (void)drawRoute {
//    initialize your map view and add it to your view hierarchy - **set its delegate to self***
    
    if (!self.route || self.route.segments.count == 0) {
        return;
    }
    
    self.polylineRenderers = [[NSMutableArray alloc]init];
    
    for (GPARouteSegment *segment in self.route.segments) {
        MKPolyline *polyline = [self.class polylineWithSegment:segment];
        
        [self.mapView addOverlay:polyline];
        MKPolylineRenderer *polylineRenderer = [[MKPolylineRenderer alloc] initWithPolyline:polyline];
        [self.polylineRenderers addObject:polylineRenderer];
    }
    
    
    
//    [self.mapView setVisibleMapRect:[self.routeLine boundingMapRect]]; //If you want the route to be visible
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer *lineView = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
        lineView.strokeColor = [UIColor redColor];
        
        
        return lineView;
    }
    
    return nil;
}

+ (MKPolyline *)polylineWithSegment:(GPARouteSegment *)segment {
    
    NSUInteger coordinateArrayLength = segment.coordinates.count;
    if (coordinateArrayLength == 0) {
        return nil;
    }
    
    CLLocationCoordinate2D coordinateArray[coordinateArrayLength];
    
    for (int i = 0; i < coordinateArrayLength; i++) {
        GPACoordinate *coordinate = segment.coordinates[i];
        CLLocationCoordinate2D c = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
        
        coordinateArray[i] = c;
    }
    
    MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinateArray count:coordinateArrayLength];
//    NSString *hexString = segment.color;
//    
//    UIColor *color = [UIColor blueColor];
//    
//    if (hexString.length == 7) {
//        color = [UIColor colorFromHexString:hexString];
//    }
//    
//    routePolyline.lineColor = color;
    return polyline;
}

@end

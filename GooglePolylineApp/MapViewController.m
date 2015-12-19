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
#import "UIHelpers/UIColor+Helper.h"

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) NSMutableArray<MKPolyline *>* polylines;
@property (nonatomic, strong) NSMutableArray<UIColor*>* colors;

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
    
    self.polylines = [[NSMutableArray alloc]init];
    self.colors = [[NSMutableArray alloc]init];
    
    for (GPARouteSegment *segment in self.route.segments) {
        if (segment.coordinates.count >= 2) {
            MKPolyline *polyline = [self.class polylineWithSegment:segment];
            [self.polylines addObject:polyline];
            [self.colors addObject:[UIColor colorFromHexString:segment.color]];
            [self.mapView addOverlay:polyline];
        }
    }
    
    [self.mapView setVisibleMapRect:[self.polylines[0] boundingMapRect]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        
        MKPolyline *polyline = overlay;
        NSUInteger index = [self.polylines indexOfObject:polyline];
        
        MKPolylineRenderer *lineView = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
        lineView.strokeColor = self.colors[index];
        
        
        return lineView;
    }
    
    return nil;
}

+ (MKPolyline *)polylineWithSegment:(GPARouteSegment *)segment {
    
    NSUInteger coordinateArrayLength = segment.coordinates.count;
    if (coordinateArrayLength < 2) {
        return nil;
    }
    
    CLLocationCoordinate2D coordinateArray[coordinateArrayLength];
    
    for (int i = 0; i < coordinateArrayLength; i++) {
        GPACoordinate *coordinate = segment.coordinates[i];
        CLLocationCoordinate2D c = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
        
        coordinateArray[i] = c;
    }
    
    MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinateArray count:coordinateArrayLength];

    return polyline;
}

@end

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
#import "Helpers/UIColor+Helper.h"
#import "GPABoundingBox.h"
#import "GPACoordinate+Converter.h"

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) NSMutableArray<MKPolyline *>* polylines;
@property (nonatomic, strong) NSMutableArray<UIColor*>* colors;

@end

@implementation MapViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    [self drawRoute];
}

-(void)viewDidAppear:(BOOL)animated {
    [self focusRoute];
}

- (void)drawRoute {
    
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
}

- (void)focusRoute {
    GPABoundingBox *routeBoundingBox = self.route.boundingBox;
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:self.route.boundingBox.topLeft.location];
    [annotation setTitle:@"TL"]; //You can set the subtitle too
    [self.mapView addAnnotation:annotation];
    
    MKPointAnnotation *annotationB = [[MKPointAnnotation alloc] init];
    [annotationB setCoordinate:self.route.boundingBox.bottomRight.location];
    [annotationB setTitle:@"BR"]; //You can set the subtitle too
    [self.mapView addAnnotation:annotationB];
    
    CLLocationCoordinate2D minCoord = CLLocationCoordinate2DMake(routeBoundingBox.topLeft.latitude, routeBoundingBox.topLeft.longitude);
    CLLocationCoordinate2D maxCoord = CLLocationCoordinate2DMake(routeBoundingBox.bottomRight.latitude, routeBoundingBox.bottomRight.longitude);
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake((minCoord.latitude+maxCoord.latitude)/2.0, (minCoord.longitude+maxCoord.longitude)/2.0);
    MKCoordinateSpan span = MKCoordinateSpanMake(maxCoord.latitude - minCoord.latitude, maxCoord.longitude - minCoord.longitude);
    MKCoordinateRegion region = MKCoordinateRegionMake (center, span);
    MKCoordinateRegion fittingRegion = [self.mapView regionThatFits:region];
    
    [self.mapView setRegion:fittingRegion];
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

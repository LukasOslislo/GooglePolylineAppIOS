//
//  GPAMapViewController.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 13/12/15.
//

#import "GPAMapViewController.h"
#import <MapKit/MapKit.h>
#import "GPARouteSegment.h"
#import "GPACoordinate.h"
#import "Helpers/UIColor+Helper.h"
#import "GPACoordinate+Converter.h"

@interface GPAMapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) NSMutableArray<MKPolyline *>* polylines;
@property (nonatomic, strong) NSMutableArray<UIColor*>* colors;

@property (nonatomic, strong) NSMutableArray *annotations;

@end

@implementation GPAMapViewController


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
            MKPolyline *polyline = [self polylineWithSegment:segment];
            [self.polylines addObject:polyline];
            [self.colors addObject:[UIColor colorFromHexString:segment.color]];
            [self.mapView addOverlay:polyline];
        }
    }
}

- (void)focusRoute {
    [self.mapView showAnnotations:self.mapView.annotations animated:NO];
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

- (MKPolyline *)polylineWithSegment:(GPARouteSegment *)segment {
    
    NSUInteger coordinateArrayLength = segment.coordinates.count;
    if (coordinateArrayLength < 2) {
        return nil;
    }
    
    CLLocationCoordinate2D coordinateArray[coordinateArrayLength];
    
    for (int i = 0; i < coordinateArrayLength; i++) {
        GPACoordinate *coordinate = segment.coordinates[i];
        
        coordinateArray[i] = coordinate.location;
        
        if (i == 0 || i == coordinateArrayLength-1) {
            
            NSString *nameAddition = i == 0 ? @"START" : @"END";
            
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            [annotation setCoordinate:coordinate.location];
            [annotation setTitle: [NSString stringWithFormat:@"%@ - %@", segment.travelMode, nameAddition]];
            [annotation setSubtitle:segment.segmentName];
            [self.mapView addAnnotation:annotation];
        }
    }
    
    MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinateArray count:coordinateArrayLength];

    return polyline;
}

@end

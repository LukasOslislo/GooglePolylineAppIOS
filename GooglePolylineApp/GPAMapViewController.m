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
#import "GPASegmentVizualizerViewController.h"
#import "GPAStop.h"
#import "UIColor+Helper.h"
#import "NSDate+Converter.h"
#import <Mapbox/Mapbox.h>

@interface GPAMapViewController () <MGLMapViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *mapBoxView;

@property (nonatomic, strong) NSMutableArray<MGLPolyline *>* polylines;
@property (nonatomic, strong) NSMutableArray<UIColor*>* colors;

@property (nonatomic, strong) NSMutableArray<MGLPointAnnotation *> *annotations;
@property (weak, nonatomic) IBOutlet UIStackView *bottomStackView;
@property (nonatomic, strong) MGLMapView *mapView;

@end

@implementation GPAMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView = [[MGLMapView alloc] initWithFrame:self.mapBoxView.bounds];
    [self.mapBoxView addSubview:self.mapView];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    
    [self drawRoute];
    [self setupBottomStackView];
    [self focusRoute];
}

-(void)viewDidAppear:(BOOL)animated {

}

- (void)drawRoute {
    
    if (!self.route || self.route.segments.count == 0) {
        return;
    }
    
    self.polylines = [[NSMutableArray alloc]init];
    self.colors = [[NSMutableArray alloc]init];
    
    for (GPARouteSegment *segment in self.route.segments) {
        if (segment.coordinates.count >= 2) {
            MGLPolyline *polyline = [self polylineWithSegment:segment];
            [self.polylines addObject:polyline];
            [self.colors addObject:[UIColor colorFromHexString:segment.color]];
            [self.mapView addOverlay:polyline];
        }
    }
}

- (void)setupBottomStackView {
    
    for (GPARouteSegment *segment in self.route.segments) {
        
        NSString *guidanceString = segment.travelMode;
        
        for (int i = 0; i < segment.stops.count; i++) {
            
            GPAStop *stop = segment.stops[i];
            GPASegmentVizualizerViewController * segmentVizualizerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SegmentVizualizer"];
            
            [self.bottomStackView addArrangedSubview:segmentVizualizerVC.view];
            
            //todo: remove this with something proper
            NSString *fallbackString = i <segment.stops.count-1 ? [NSString stringWithFormat:@"Start walking towards %@", segment.stops[i+1].stopName] :  @"Unknown address";
            segmentVizualizerVC.nameLabel.text = stop.stopName ? [NSString stringWithFormat:@"%@: %@",guidanceString, stop.stopName] : fallbackString;
            
            segmentVizualizerVC.dateLabel.text = [NSDate formatStringFromDate:stop.dateTime];
            segmentVizualizerVC.view.backgroundColor = [UIColor colorFromHexString: segment.color];
            [segmentVizualizerVC.view.heightAnchor constraintEqualToConstant:50].active = true;
            [segmentVizualizerVC.view.widthAnchor constraintEqualToConstant:250].active = true;
            
            [segmentVizualizerVC.view layoutSubviews];
        }
    }
}

- (void)focusRoute {
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(52.509663, 13.390481)
                       zoomLevel:12.1
                        animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)mapView:(MGLMapView *)mapView strokeColorForShapeAnnotation:(nonnull MGLShape *)annotation {

        if ([annotation isKindOfClass:[MGLPolyline class]]) {
    
            MGLPolyline *polyline = (MGLPolyline *)annotation;
            NSUInteger index = [self.polylines indexOfObject:polyline];
    
            return self.colors[index];
        }
        
        return nil;
}

// Always show a callout when an annotation is tapped.
- (BOOL)mapView:(MGLMapView *)mapView annotationCanShowCallout:(id <MGLAnnotation>)annotation {
    return YES;
}

- (MGLPolyline *)polylineWithSegment:(GPARouteSegment *)segment {
    
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
            
            MGLPointAnnotation *annotation = [[MGLPointAnnotation alloc] init];
            [annotation setCoordinate:coordinate.location];
            [annotation setTitle: [NSString stringWithFormat:@"%@ - %@", segment.travelMode, nameAddition]];
            [annotation setSubtitle:segment.segmentName];
            [self.annotations addObject:annotation];
            [self.mapView addAnnotation:annotation];
        }
    }
    
    MGLPolyline *polyline = [MGLPolyline polylineWithCoordinates:coordinateArray count:coordinateArrayLength];

    return polyline;
}

@end

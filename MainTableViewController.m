//
//  MainTableViewController.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 13/12/15.
//

#import "MainTableViewController.h"
#import "RouteTableViewCell.h"
#import "MapViewController.h"
#import "GPARouteRequest.h"
#import "GPARouteSegment.h"
#import "GPAPolylineEncoding.h"
#import "GPAProvider.h"

@interface MainTableViewController ()

@property (nonatomic, strong)NSArray<GPARoute *> *routes;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GPARouteRequest *request = [[GPARouteRequest alloc]init];
    [request fetchRoutesWithCallback:^(NSArray<GPARoute *> *result) {
        [self setupTableData:result];
    }];
}

- (void)setupTableData:(NSArray<GPARoute *> *)routes{
    self.routes = routes;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showMap"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
//        MapViewController *mapVC = (MapViewController *)[[segue destinationViewController] topViewController];
//        [controller setDetailItem:object];
//        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.routes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RouteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"routeCell" forIndexPath:indexPath];
    GPARoute *route = self.routes[indexPath.row];
    cell.routeNameLabel.text = route.provider.name;
    cell.routeProvider.text = [GPARoute stringFromRouteType:route.routeType];
    cell.routePriceLabel.text = route.price;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GPARoute *selectedRoute = self.routes[indexPath.row];
    
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MapViewController * mapVC = [storyboard instantiateViewControllerWithIdentifier:@"MapView"];

    mapVC.route = selectedRoute;
    
    
    [self.navigationController pushViewController:mapVC animated:NO];
}

@end

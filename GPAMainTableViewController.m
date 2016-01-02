//
//  GPAMainTableViewController.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 13/12/15.
//

#import "GPAMainTableViewController.h"
#import "GPARouteTableViewCell.h"
#import "GPAMapViewController.h"
#import "GPARouteRequest.h"
#import "GPARouteSegment.h"
#import "GPAPolylineEncoding.h"
#import "GPAProvider.h"

@interface GPAMainTableViewController ()

@property (nonatomic, strong)NSArray<GPARoute *> *routes;

@end

@implementation GPAMainTableViewController

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
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.routes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GPARouteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"routeCell" forIndexPath:indexPath];
    GPARoute *route = self.routes[indexPath.row];
    cell.routeNameLabel.text = route.provider.name;
    cell.routeProvider.text = [GPARoute stringFromRouteType:route.routeType];
    cell.routePriceLabel.text = route.price;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GPARoute *selectedRoute = self.routes[indexPath.row];
    
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GPAMapViewController * mapVC = [storyboard instantiateViewControllerWithIdentifier:@"MapView"];

    mapVC.route = selectedRoute;
    
    [self.navigationController pushViewController:mapVC animated:NO];
}

@end

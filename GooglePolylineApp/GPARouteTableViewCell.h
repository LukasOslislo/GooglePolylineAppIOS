//
//  GPARouteTableViewCell.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 13/12/15.
//

#import <UIKit/UIKit.h>

@interface GPARouteTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *routeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *routeProvider;
@property (weak, nonatomic) IBOutlet UILabel *routePriceLabel;

@end

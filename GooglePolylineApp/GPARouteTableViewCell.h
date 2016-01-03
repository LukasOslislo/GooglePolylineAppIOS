//
//  GPARouteTableViewCell.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 13/12/15.
//

#import <UIKit/UIKit.h>

@interface GPARouteTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *routeDestinationLabel;
@property (weak, nonatomic) IBOutlet UILabel *routeTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *routeProvider;
@property (weak, nonatomic) IBOutlet UILabel *routePriceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *routeImage;

@end

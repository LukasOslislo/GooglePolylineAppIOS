//
//  UIColor+Helper.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 19/12/15.
//

#import <UIKit/UIKit.h>

@interface UIColor (Helper)

/**
 *  Creates an UIColor from a hex string
 *
 *  @param hexString RGS hex string, e.g. #FF0000 for red
 *
 *  @return a UIColor
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end

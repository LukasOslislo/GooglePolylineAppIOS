//
//  UIColor+Helper.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 19/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "UIColor+Helper.h"

@implementation UIColor (Helper)

/**
 *  Helper method to create UIColor from hex string.
 *
 *  Source: http://stackoverflow.com/a/12397366/1374488
 *
 *  @param hexString string in format: @"#RRGGBB"
 *
 *  @return UIColor from string
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end

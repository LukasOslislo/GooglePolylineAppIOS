//
//  GPAProvider+Data.h
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 16/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "GPAProvider.h"

@interface GPAProvider (Data)

+ (GPAProvider *)providerWithKey:(NSString *)providerKey andProvidersData:(NSDictionary *)providersData;

@end

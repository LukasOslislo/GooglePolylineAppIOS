//
//  GPAProvider+Data.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 16/12/15.
//  Copyright © 2015 Lukas Oslislo. All rights reserved.
//

#import "GPAProvider+Data.h"

#import "NSDictionary+Safe.h"

@interface GPAProvider (Private)

@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSString *iconUrl;

@end

@implementation GPAProvider (Data)

+ (GPAProvider *)providerWithKey:(NSString *)providerKey andProvidersData:(NSDictionary *)providersData {
    
    GPAProvider *provider = [[GPAProvider alloc]init];
    NSDictionary *providerData = [providersData safeObjectForKey:providerKey];
    
    NSString *providerName = [providerData safeObjectForKey:@"display_name"];
    provider.name = providerName ? providerName : providerKey;
    provider.iconUrl = [providerData safeObjectForKey:@"provider_icon_url"];
    
    return provider;
}

@end

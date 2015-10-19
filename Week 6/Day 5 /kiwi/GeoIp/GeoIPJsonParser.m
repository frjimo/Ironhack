//
//  GeoIPJsonParser.m
//  GeoIp
//
//  Created by Diego Freniche Brito on 14/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "GeoIPJsonParser.h"

@implementation GeoIPJsonParser

+ (GeoIPJSON *)parseJSONString:(NSString *)jsonAsString {
    if (jsonAsString == nil || jsonAsString.length == 0) {
        return nil;
    }
    
    NSData *data = [jsonAsString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        return nil;
    }

    GeoIPJSON *result = [[GeoIPJSON alloc] init];
    
    result.ip = jsonData[@"ip"];
    result.asn = jsonData[@"asn"];
    result.continent_code = jsonData[@"continent_code"];
    result.country = jsonData[@"country"];
    result.country_code = jsonData[@"country_code"];
    result.country_code3 = jsonData[@"country_code3"];
    result.dma_code = jsonData[@"dma_code"];
    result.isp = jsonData[@"isp"];
    result.latitude = [jsonData[@"latitude"] floatValue];
    result.longitude = [jsonData[@"longitude"] floatValue];
    
    return result;
}


@end

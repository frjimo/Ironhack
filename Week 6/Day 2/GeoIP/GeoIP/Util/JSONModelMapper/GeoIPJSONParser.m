//
//  JSONParser.m
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 7/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "GeoIPJSONParser.h"
#import "IpJSON.h"

@implementation GeoIPJSONParser

+ (IpJSON *)parseJSONString:(NSString *)jsonAsString {
    NSData *data = [jsonAsString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        return nil;
    }
    
    IpJSON *result = [[IpJSON alloc] init];
    
    result.country = [jsonData objectForKey:@"country"];
    result.ip = [jsonData objectForKey:@"ip"];
    result.latitude = [jsonData[@"latitude"] floatValue];
    result.longitude = [jsonData[@"longitude"] floatValue];
    
    
    result.asn = [jsonData objectForKey:@"asn"];
    result.country_code = [jsonData objectForKey:@"country_code"];
    result.area_code = [jsonData objectForKey:@"area_code"];
    result.country_code3 = [jsonData objectForKey:@"country_code3"];
    result.continent_code = [jsonData objectForKey:@"continent_code"];
    result.isp = [jsonData objectForKey:@"isp"];
    result.dma_code = [jsonData objectForKey:@"dma_code"];
    
    return result;
    
}


@end

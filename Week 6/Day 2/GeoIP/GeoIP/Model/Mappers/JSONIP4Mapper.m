//
//  JSONRadarMapper.m
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 8/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "JSONIP4Mapper.h"

@implementation JSONIP4Mapper

+ (IP4 *)mapJSONIP4s:(IpJSON *)jsonIP4s inContext:(NSManagedObjectContext *)context{
    IP4 *IP4JSON = [[IP4 alloc] init];
    
    IP4 *ip = [IP4 IP4WithCountry:IP4JSON.country andIP:IP4JSON.ip andLatitude:IP4JSON.latitude andLongitude:IP4JSON.longitude inContext:context];
    
    NSError *error;
    [context save:&error];
    if (error) {
        return nil;
    }
    
    return ip;
}

//+ (NSArray<IP4 *>*)mapJSONIP4s:(NSArray<IP4JSON *>*)jsonIP4s inContext:(NSManagedObjectContext *)context{
//    NSMutableArray<IP4 *> *IP4s = [NSMutableArray arrayWithCapacity:jsonIP4s.count];
//    
//    for (IP4JSON *IP4JSON in jsonIP4s) {
//        IP4 *ip = [IP4 IP4WithCountry:IP4JSON.country andIP:IP4JSON.ip andLatitude:IP4JSON.latitude andLongitude:IP4JSON.longitude inContext:context];
//        [IP4s addObject:ip];
//    }
//    
//    NSError *error;
//    [context save:&error];
//    if (error) {
//        return nil;
//    }
//    
//    return IP4s;
//}

@end

#import "JSONRadarMapper.h"

@implementation JSONRadarMapper

+ (NSArray<GeoIP *>*)mapJSON:(NSArray<GeoIPJSON *>*)json inContext:(NSManagedObjectContext *)context {
    
    NSMutableArray<GeoIP *> *ips = [NSMutableArray arrayWithCapacity:json.count];
    
    for (GeoIPJSON *ipJSON in json) {
        GeoIP *ip = [GeoIP insertInManagedObjectContext:context];
        ip.ip = ipJSON.ip;
        ip.latitudeValue = ipJSON.latitude;
        ip.longitudeValue = ipJSON.longitude;
        ip.country = ipJSON.country;
        
        [ips addObject:ip];
    }
    
    NSError *error;
    [context save:&error];
    if (error) {
        return nil;
    }
    
    return ips;
}

@end

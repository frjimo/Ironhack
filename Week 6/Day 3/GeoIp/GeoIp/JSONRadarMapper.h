#import <Foundation/Foundation.h>
#import "GeoIP.h"
#import "GeoIPJSON.h"

@interface JSONRadarMapper : NSObject

+ (NSArray<GeoIP *>*)mapJSON:(NSArray<GeoIPJSON *>*)jsonRadars inContext:(NSManagedObjectContext *)context;

@end

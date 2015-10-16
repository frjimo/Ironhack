#import "_GeoIP.h"

@interface GeoIP : _GeoIP {}
// Custom logic goes here.

+ (NSFetchRequest *)fetchRequestWithFields:(NSArray<NSString *>*)fields andOrders:(NSArray<NSNumber *>*)orders;


@end

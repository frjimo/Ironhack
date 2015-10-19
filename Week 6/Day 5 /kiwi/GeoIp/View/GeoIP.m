#import "GeoIP.h"


@interface GeoIP ()

// Private interface goes here.

@end


@implementation GeoIP

// Custom logic goes here.


+ (NSFetchRequest *)fetchRequestWithFields:(NSArray<NSString *>*)fields andOrders:(NSArray<NSNumber *>*)orders {
    
    if (fields.count != orders.count) {
        return nil;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
    
    [fetchRequest setFetchBatchSize:20];
    NSMutableArray<NSSortDescriptor *>*sortDescriptors = [[NSMutableArray alloc] init];
    for (int i = 0; i < fields.count; i++) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:fields[i] ascending:orders[i].boolValue];
        [sortDescriptors addObject:sortDescriptor];
    }
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    return fetchRequest;
}


@end

//
//  IP4.m
//  GeoIP
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "IP4.h"
#import "NSManagedObjectContext+DFInsertManagedObject.h"

@implementation IP4

+ (IP4 *)IP4WithCountry:(NSString *)country andIP:(NSString *)ip andLatitude:(NSNumber *)latitude andLongitude:(NSNumber *)longitude inContext:(NSManagedObjectContext *)context{
    
    IP4 *ip4 = (IP4 *)[context insertNewObjectForEntityForName:[IP4 description]];
    
    [ip4 setCountry:country];
    [ip4 setIp:ip];
    [ip4 setLatitude:latitude];
    [ip4 setLongitude:longitude];
    
    return ip4;
}


+ (NSFetchRequest *)fetchRequestWithFields:(NSArray<NSString *>*)fields andOrders:(NSArray<NSNumber *>*)orders {
    
    if (fields.count != orders.count) {
        return nil;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[IP4 description]];
    
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

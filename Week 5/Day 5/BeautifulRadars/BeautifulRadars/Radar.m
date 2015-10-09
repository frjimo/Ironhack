//
//  Radar.m
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 6/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "Radar.h"
#import "NSManagedObjectContext+DFInsertManagedObject.h"

@implementation Radar

// Insert code here to add functionality to your managed object subclass

+ (Radar *)radarWithUser:(NSString *)user andTitle:(NSString *)title inContext:(NSManagedObjectContext *)context {
    
    Radar *radar = (Radar *)[context insertNewObjectForEntityForName:[Radar description]];
    
    [radar setTitle:title];
    [radar setUser:user];
    
    return radar;
}

+ (NSFetchRequest *)fetchRequestWithFields:(NSArray<NSString *>*)fields andOrders:(NSArray<NSNumber *>*)orders {
    
    if (fields.count != orders.count) {
        return nil;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Radar description]];
    
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

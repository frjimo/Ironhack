//
//  IP4.h
//  GeoIP
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface IP4 : NSManagedObject

+ (IP4 *)IP4WithCountry:(NSString *)country andIP:(NSString *)ip andLatitude:(float)latitude andLongitude:(float)longitude inContext:(NSManagedObjectContext *)context;

+ (NSFetchRequest *)fetchRequestWithFields:(NSArray<NSString *>*)fields andOrders:(NSArray<NSNumber *>*)orders;

@end

NS_ASSUME_NONNULL_END

#import "IP4+CoreDataProperties.h"

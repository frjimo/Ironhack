//
//  Radar.h
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 6/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Radar : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

+ (Radar *)radarWithUser:(NSString *)user andTitle:(NSString *)title inContext:(NSManagedObjectContext *)context;

+ (NSFetchRequest *)fetchRequestWithFields:(NSArray<NSString *>*)fields andOrders:(NSArray<NSNumber *>*)orders;

@end

NS_ASSUME_NONNULL_END

#import "Radar+CoreDataProperties.h"

//
//  NSManagedObjectContext+FJInsertManagedObject.h
//  Radar
//
//  Created by Fran on 6/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (FJInsertManagedObject)

- (NSManagedObject *)insertNewObjectForEntityForName:(NSString *)entityName;

@end

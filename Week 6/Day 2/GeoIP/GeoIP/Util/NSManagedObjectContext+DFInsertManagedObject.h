//
//  NSManagedObjectContext+DFInsertManagedObject.h
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 6/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (DFInsertManagedObject)
- (NSManagedObject *)insertNewObjectForEntityForName:(NSString *)entityName;
@end

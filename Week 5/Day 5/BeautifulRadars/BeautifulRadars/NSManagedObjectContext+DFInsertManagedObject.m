//
//  NSManagedObjectContext+DFInsertManagedObject.m
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 6/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "NSManagedObjectContext+DFInsertManagedObject.h"

@implementation NSManagedObjectContext (DFInsertManagedObject)

- (NSManagedObject *)insertNewObjectForEntityForName:(NSString *)entityName {
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self];
    
    return object;
}

@end

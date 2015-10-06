//
//  NSManagedObjectContext+FJInsertManagedObject.m
//  Radar
//
//  Created by Fran on 6/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "NSManagedObjectContext+FJInsertManagedObject.h"

@implementation NSManagedObjectContext (FJInsertManagedObject)

- (NSManagedObject *)insertNewObjectForEntityForName:(NSString *)entityName{
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self];
    
    return object;
}

@end

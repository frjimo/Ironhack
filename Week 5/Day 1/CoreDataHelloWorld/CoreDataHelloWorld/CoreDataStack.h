//
//  CoreDataStack.h
//  CoreDataHelloWorld
//
//  Created by Fran on 5/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)saveContext;

@end

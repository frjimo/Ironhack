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

- (instancetype)initWithDatabaseFileName:(NSString *)fileName andPersitenceType:(NSString *)storeType;

- (void)saveContext;

@end

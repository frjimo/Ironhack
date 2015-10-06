//
//  CoreDataStack.m
//  CoreDataHelloWorld
//
//  Created by Fran on 5/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "CoreDataStack.h"
#import "FileUtils.h"

@interface CoreDataStack ()

@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *storeType;


@end

@implementation CoreDataStack

@synthesize managedObjectContext = _managedObjectContext;

- (instancetype)initWithDatabaseFileName:(NSString *)fileName andPersitenceType:(NSString *)storeType{
    self = [super init];
    if (self){
        _fileName = fileName;
        _storeType = storeType;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithDatabaseFileName:@"database.sqlite" andPersitenceType:NSInMemoryStoreType];
    return  self;
}

- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // Create the coordinator and store
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    //NSURL *storeURL = [[FileUtils applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataHelloWorld.sqlite"];
    NSURL *storeURL = [[FileUtils applicationDocumentsDirectory] URLByAppendingPathComponent:self.fileName];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    //if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
    if (![_persistentStoreCoordinator addPersistentStoreWithType:self.storeType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel {
   
    NSManagedObjectModel *_managedObjectModel;
//    
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataHelloWorld" withExtension:@"momd"];
//    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:@[[NSBundle mainBundle]]];
    
    return _managedObjectModel;
}


- (void)saveContext {
    NSError *error = nil;
    if ([self.managedObjectContext hasChanges] && ![self.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}


@end

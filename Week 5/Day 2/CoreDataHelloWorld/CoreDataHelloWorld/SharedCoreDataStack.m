//
//  SharedCoreDataStack.m
//  CoreDataHelloWorld
//
//  Created by Fran on 6/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "SharedCoreDataStack.h"


@implementation SharedCoreDataStack

+ (CoreDataStack *)sharedInstanceWithDatabaseFileName:(NSString *)fileName andPersitenceType:(NSString *)persistenceType
{
    static dispatch_once_t once;
    static CoreDataStack *sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] initWithDatabaseFileName:fileName andPersitenceType:persistenceType];
    });
    
    return sharedInstance;
}

@end

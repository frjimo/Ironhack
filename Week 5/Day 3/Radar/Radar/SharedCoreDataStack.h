//
//  SharedCoreDataStack.h
//  CoreDataHelloWorld
//
//  Created by Fran on 6/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataStack.h"

@interface SharedCoreDataStack : NSObject

+ (CoreDataStack *)sharedInstanceWithDatabaseFileName:(NSString *)fileName andPersitenceType:(NSString *)persistenceType;

@end

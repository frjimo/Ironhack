#import "SharedCoreDataStack.h"


@implementation SharedCoreDataStack

+ (CoreDataStack *)sharedInstanceWithDatabaseFileName:(NSString *)fileName
                            andPersistenceType:(NSString *)persistenceType {
    static dispatch_once_t once;
    static CoreDataStack *sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] initWithDatabaseFileName:fileName andPersistenceType:persistenceType];
    });
    
    return sharedInstance;
}

@end

#import <Foundation/Foundation.h>
#import "CoreDataStack.h"

@interface SharedCoreDataStack : NSObject

+ (CoreDataStack *)sharedInstanceWithDatabaseFileName:(NSString *)fileName
                                   andPersistenceType:(NSString *)persistenceType;

@end

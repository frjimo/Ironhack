#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Radar.h"

@interface FakeRadarGenerator : NSObject

- (BOOL)generateRadarsInContext:(NSManagedObjectContext *)context;

@end

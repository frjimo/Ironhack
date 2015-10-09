#import <XCTest/XCTest.h>
#import "CoreDataStack.h"
#import "Radar.h"
#import "NSManagedObjectContext+DFInsertManagedObject.h"

@interface RadarTests : XCTestCase

@property (nonnull, nonatomic, strong) CoreDataStack *cds;
@property (nonnull, nonatomic, strong) NSManagedObjectContext *context;
@end

@implementation RadarTests

- (void)setUp {
    [super setUp];
    
    self.cds = [[CoreDataStack alloc] init];
    self.context = self.cds.managedObjectContext;
}


- (void)testCanInsertANewValidRadar {
    Radar *sut = [self insertExampleRadar];
    
    XCTAssertNotNil(sut);
    NSError *error;
    [self.context save:&error];
    
    XCTAssertNil(error);
}

- (void)testCantInsertAnInvalidRadarWithWrongEmail {
    Radar *sut = [self insertExampleRadar];
    
    sut.user = @"fail://thisisnotanemail.com";
    
    XCTAssertNotNil(sut);
    NSError *error;
    [self.context save:&error];
    
    XCTAssertNotNil(error);
}

- (void)testCanDeleteAFreshlyInsertedRadar {
    Radar *sut = [self insertExampleRadar];

    [self.context deleteObject:sut];
    
    NSError *error;
    [self countAllRadars:&error];
    
    XCTAssertNil(error);
}

- (NSUInteger)countAllRadars:(NSError **)radarError {
    NSUInteger radarCount;
    
    NSFetchRequest *request = [self fetchRequestAllRadars];
    
    NSError *error;
    radarCount = [[self.context executeFetchRequest:request error:&error] count];
    
    *radarError = error;
    
    return radarCount;
}

- (NSFetchRequest *)fetchRequestAllRadars {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[Radar description]];
    NSSortDescriptor *sortByUserEmail = [NSSortDescriptor sortDescriptorWithKey:@"user" ascending:YES];
    [request setSortDescriptors:@[sortByUserEmail]];
    
    return request;
}


- (Radar *)insertExampleRadar {
    Radar *sut = (Radar *)[self.context insertNewObjectForEntityForName:[Radar description]];
    sut.title = @"Radar title";
    sut.user = @"tim@apple.com";
    return sut;
}

@end

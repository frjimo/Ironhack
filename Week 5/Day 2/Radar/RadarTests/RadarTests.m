//
//  RadarTests.m
//  RadarTests
//
//  Created by Fran on 6/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "CoreDataStack.h"
#import "Radar.h"
#import "NSManagedObjectContext+FJInsertManagedObject.h"

@interface RadarTests : XCTestCase

@property (nonatomic, strong) CoreDataStack * cds;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation RadarTests

- (void)setUp {
    [super setUp];
    
    self.cds = [[CoreDataStack alloc]init];
    
    self.context = self.cds.managedObjectContext;
}

- (void)tearDown {
    
    
    self.cds = nil;
    self.context = nil;
    
    [super tearDown];
    
}

- (Radar *)insertExammpleRadarCategory {
    Radar *radar = (Radar *)[self.context insertNewObjectForEntityForName:[Radar description]];
    
    radar.user = @"frjimo@gmail.com";
    radar.title = @"Bug";
    return radar;
}

- (void)testCanInsertANewValidRadarCategory {
    Radar *radar = [self insertExammpleRadarCategory];
    
    XCTAssertNotNil(radar);
    
    NSError *error;
    [self.context save:&error];
    
    XCTAssertNil(error);
}


- (void)testCantInsertARadarWithWrongTitle {
    Radar * radar = [self insertExammpleRadarCategory];
    
    radar.title = nil;
    
    NSError *error;
    [self.context save:&error];
    XCTAssertNotNil(error);
}

- (void)testCantInsertARadarWithWrongEmail {
    Radar * radar = [self insertExammpleRadarCategory];
    
    radar.user = nil;
    
    NSError *error;
    [self.context save:&error];
    XCTAssertNotNil(error);
}

- (void)testAfterInsertARadarInTheDataBaseHasBeenSaved {
    NSFetchRequest *query = [self fetchRequestByUser];
    NSError *error;

    NSArray<Radar *> *result = [self.context  executeFetchRequest:query error:&error];
    NSUInteger lastCount = result.count;
    
    Radar * radar = [self insertExammpleRadarCategory];
    
    [self.context save:&error];
    XCTAssertNil(error);
    
    query = [self fetchRequestByUser];
    
    error = nil;
    result = [self.context  executeFetchRequest:query error:&error];
    
    XCTAssertNotNil(result);
    XCTAssertNil(error);
    XCTAssertTrue(result.count == lastCount + 1);
    
}

- (NSFetchRequest *)fetchRequestByUser {
    NSFetchRequest *query = [[NSFetchRequest alloc]initWithEntityName:[Radar description]];
    NSSortDescriptor *orderByName = [[NSSortDescriptor alloc]initWithKey:@"user" ascending:YES];
    
    [query setSortDescriptors:@[orderByName]];
    
    return query;
}

- (void)testAfterDeleteARadarInTheDataBaseHasBeenDeleted {
    NSFetchRequest *query = [self fetchRequestByUser];
    NSError *error;
    Radar * radar = [self insertExammpleRadarCategory];
    
    NSArray<Radar *> *result = [self.context  executeFetchRequest:query error:&error];
    NSUInteger lastCount = result.count;
    
    
    
    [self.context save:&error];
    XCTAssertNil(error);
    
    query = [self fetchRequestByUser];
    
    error = nil;
    [self.context deleteObject:radar];
    result = [self.context  executeFetchRequest:query error:&error];
    
    XCTAssertNotNil(result);
    XCTAssertNil(error);
    XCTAssertTrue(result.count == lastCount - 1);
}





@end

//
//  PersonTests.m
//  CoreDataHelloWorld
//
//  Created by Fran on 5/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CoreDataStack.h"
#import "Person.h"

@interface PersonTests : XCTestCase

@property (nonatomic, strong) CoreDataStack * cds;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation PersonTests

- (void)setUp {
    self.cds = [[CoreDataStack alloc]init];
    
    self.context = self.cds.managedObjectContext;
}

- (void)tearDown {
    self.cds = nil;
    self.context = nil;
}

- (void)testCanInsertAPersonWithAValidName {
    
    Person * sut = (Person *)[NSEntityDescription insertNewObjectForEntityForName:[Person description]  inManagedObjectContext:self.context];
    
    XCTAssertEqualObjects(@"John Doe", sut.name);
    
    sut.name = @"Happy Person number one";
    
    XCTAssertEqualObjects(@"Happy Person number one", sut.name);
    
    NSError *error;
    [self.context save:&error];
    
    XCTAssertNil(error);
}

- (void)testCanInsertAPersonWithNilName {

    Person * sut = (Person *)[NSEntityDescription insertNewObjectForEntityForName:[Person description]  inManagedObjectContext:self.context];
    
    sut.name = nil;
    
    XCTAssertNil(sut.name);
    
    NSError *error;
    [self.context save:&error];
    
    XCTAssertNotNil(error);
}

- (void)testCanInsertAPersonWith255CharLongName {

    Person * sut = (Person *)[NSEntityDescription insertNewObjectForEntityForName:[Person description]  inManagedObjectContext:self.context];
    
    sut.name = [@"" stringByPaddingToLength:255 withString:@"abc" startingAtIndex:0];
    
    XCTAssertNotNil(sut.name);
    
    NSError *error;
    [self.context save:&error];
    
    XCTAssertNil(error);
}

- (void)testCanInsertAPersonWith256CharLongName {

    Person * sut = (Person *)[NSEntityDescription insertNewObjectForEntityForName:[Person description]  inManagedObjectContext:self.context];
    
    sut.name = [@"" stringByPaddingToLength:256 withString:@"abc" startingAtIndex:0];
    
    XCTAssertNotNil(sut.name);
    XCTAssertTrue(sut.name.length == 256);
    
    NSError *error;
    [self.context save:&error];
    
    XCTAssertNotNil(error);
}

@end

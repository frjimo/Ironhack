//
//  PersonTests.m
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Person.h"

@interface PersonTests : XCTestCase

@property (nonatomic, strong) Person *person;

@end

@implementation PersonTests

- (void)setUp {
    [super setUp];
    
    self.person = [[Person alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    
    _person = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//----------------------------------------------------------------------------------------------

- (void)testCanCreateAPerson {
    
    Person *person = [[Person alloc] init];
    
    XCTAssertNotNil(person,@"After creation person should not be nil");
    XCTAssertEqualObjects(person.name, nil, @"After creation person name should be nil");
    XCTAssertEqual(person.age, 0,@"After creation person age should be 0");
}

- (void)testCanCreateAPersonWithName {
    
    Person *anotherPerson = [[Person alloc] initWithName:@"Fran"];
    
    XCTAssertEqualObjects(anotherPerson.name, @"Fran", @"After creation person name should be Toni");
}

- (void)testCanCreateAPersonWithNameAndAddress {
    
    Person *anotherPerson = [[Person alloc] initWithName:@"Fran" address:@"Valdepeñas"];
    
    XCTAssertEqualObjects(anotherPerson.name, @"Fran", @"After creation person name should be Toni");
    XCTAssertEqualObjects(anotherPerson.address, @"Valdepeñas", @"After creation person address should be Conde de Torralba");
}

- (void)testCanCreateAPersonWithNameAddressAndAge {
    
    Person *anotherPerson = [[Person alloc] initWithName:@"Fran" address:@"Valdepeñas" age:24];
    
    XCTAssertEqualObjects(anotherPerson.name, @"Fran", @"After creation person name should be Toni");
    XCTAssertEqualObjects(anotherPerson.address, @"Valdepeñas", @"After creation person address should be Conde de Torralba");
    XCTAssertEqual(anotherPerson.age, 24, @"After creation person age should be 24");
}

- (void)testCanCreateAPersonWithClassMethod {
    
    Person *anotherPerson = [[Person alloc] initWithName:@"Fran" address:@"Valdepeñas"];
    
    XCTAssertEqualObjects(anotherPerson.name, @"Fran", @"After creation person name should be Toni");
    XCTAssertEqualObjects(anotherPerson.address, @"Valdepeñas", @"After creation person address should be Conde de Torralba");
    XCTAssertEqual(anotherPerson.age, 0, @"After creation person age should be default value");
}




//----------------------------------------------------------------------------------------------

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

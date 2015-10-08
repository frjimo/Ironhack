//
//  JSONParserTests.m
//  Radar
//
//  Created by Fran on 7/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "JSONParser.h"
#import "StubFileUtil.h"

@interface ContextMock : NSManagedObjectContext

- (NSManagedObject *)insertNewObjectForEntityForName:(NSString *)entityName;

@end

@implementation ContextMock

- (NSManagedObject *)insertNewObjectForEntityForName:(NSString *)entityName {
    return [[NSManagedObject alloc]init];
}

@end

@interface JSONParserTests : XCTestCase

@end

@implementation JSONParserTests


- (void)testJSONParseShouldReturnNilWhenPassedAnEmptyJSONString {
    NSManagedObjectContext *mockContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    NSArray <Radar *> *radars= [JSONParser parseJSONString:@"" usingContext:mockContext];
    XCTAssertNil(radars);
}

- (void)testJSONParseShouldReturnOneRadarWhenPassedAJSONStringWithOneRadar {
    ContextMock *mockContext = [[ContextMock alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];

    NSString *stub = [StubFileUtil loadStubFileName:@"OneRadarResultStub"];
    
    NSArray <Radar *> *radars= [JSONParser parseJSONString:stub usingContext:mockContext];
    XCTAssertNotNil(radars);
    XCTAssertEqual(1, radars.count);
}

@end

//
//  IP4GeneratorTests.m
//  GeoIP
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IP4Generator.h"

@interface IP4GeneratorTests : XCTestCase

@property (nonatomic, strong) IP4Generator * ip;

@end

@implementation IP4GeneratorTests

- (void)setUp {
    [super setUp];
    
    self.ip = [[IP4Generator alloc]init];
}

- (void)tearDown {

    self.ip = nil;
    
    [super tearDown];
}

- (void)testGenerateACorrectIP {
    
    NSString *ipTest = [self.ip IP4addresses];

    XCTAssertNotNil(ipTest);
    
    NSArray* arrayNumbers = [ipTest componentsSeparatedByString: @"-"];
    XCTAssertTrue(arrayNumbers.count == 4);
    
    XCTAssertTrue([[arrayNumbers objectAtIndex:0] integerValue] >= 0);
    XCTAssertTrue([[arrayNumbers objectAtIndex:0] integerValue] <= 255);
    
    XCTAssertTrue([[arrayNumbers objectAtIndex:1] integerValue] >= 0);
    XCTAssertTrue([[arrayNumbers objectAtIndex:1] integerValue] <= 255);
    
    XCTAssertTrue([[arrayNumbers objectAtIndex:2] integerValue] >= 0);
    XCTAssertTrue([[arrayNumbers objectAtIndex:2] integerValue] <= 255);
    
    XCTAssertTrue([[arrayNumbers objectAtIndex:3] integerValue] >= 0);
    XCTAssertTrue([[arrayNumbers objectAtIndex:3] integerValue] <= 255);
    
}

- (void)testGenerateACorrectArrayIP {
    
    NSMutableArray *ipTest = [self.ip nIPAdress:2];
    
    XCTAssertNotNil(ipTest);
    XCTAssertTrue(ipTest.count == 2);
}




@end

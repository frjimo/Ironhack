//
//  GeoIPJsonParserTests.m
//  GeoIp
//
//  Created by Diego Freniche Brito on 14/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GeoIPJsonParser.h"
#import "StubFileUtil.h"

@interface GeoIPJsonParserTests : XCTestCase

@end

@implementation GeoIPJsonParserTests

- (void)testJsonParserReturnsNilWithNilInputString {
    
    GeoIPJSON *sut = [GeoIPJsonParser parseJSONString:nil];
    XCTAssertNil(sut);
}

- (void)testJsonParserReturnsNilWithEmptyInputString {
    
    GeoIPJSON *sut = [GeoIPJsonParser parseJSONString:@""];
    XCTAssertNil(sut);
}

- (void)testJsonParserReturnsCorrectIpJsonWithInputJson {
    
    NSString *json = [StubFileUtil loadStubFileNamed:@"GeoIpCorrectResponse"];
    
    GeoIPJSON *sut = [GeoIPJsonParser parseJSONString:json];
    XCTAssertNotNil(sut);
    
    XCTAssertEqualObjects(@"68.0.2.1", sut.ip);
    XCTAssertEqualObjects(@"United States", sut.country);
    XCTAssertEqual(38, sut.latitude);
    XCTAssertEqual(-97, sut.longitude);
    
}





















@end

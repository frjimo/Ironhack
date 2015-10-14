//
//  GeoIPJSONParser.m
//  GeoIP
//
//  Created by Fran on 14/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GeoIPJSONParser.m"
#import "StubFileUtil.h"

@interface GeoIPJSONParser : XCTestCase

@end

@implementation GeoIPJSONParser

- (void)testJsonParserReturnsCorrectIpJsonWithInputJson {
    NSString *json = [StubFileUtil loadStubFileNamed:@"GeoIpCorrectResponse"];
}

@end

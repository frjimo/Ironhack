//
//  RandomIPGeneratorTests.m
//  GeoIp
//
//  Created by Diego Freniche Brito on 13/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RandomIPAddressGenerator.h"

@interface RandomIPGeneratorTests : XCTestCase

@end

@implementation RandomIPGeneratorTests

- (void)testRandomIpGeneratorReturnsNonNilString {
    NSString *sut = [RandomIPAddressGenerator randomIp];
    
    XCTAssertNotNil(sut);
}

- (void)testRandomIpGeneratorReturnsValidIp {
    NSString *ip = [RandomIPAddressGenerator randomIp];
    
    NSArray *sut = [ip componentsSeparatedByString:@"."];
    
    XCTAssertEqual(4, sut.count);
    for (NSString *ipComponent in sut) {
        NSUInteger ipComp = [ipComponent intValue];
        
        XCTAssertTrue(ipComp >= 0 && ipComp < 256);
    }
}

- (void)testGroupIpGenerator {
    NSArray<NSString *> *sut = [RandomIPAddressGenerator randomIpsWithCapacity:10];
    XCTAssertNotNil(sut);
    XCTAssertEqual(10, sut.count);
    
    for (NSString *ip in sut) {
        for (NSString *ipComponent in [ip componentsSeparatedByString:@"."]) {
            NSUInteger ipComp = [ipComponent intValue];
            
            XCTAssertTrue(ipComp >= 0 && ipComp < 256);
        }
    }
}














@end

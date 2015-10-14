//
//  IP4APIWrapperTests.m
//  GeoIP
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IP4APIWrapper.h"
#import "GeoIPJSONParser.h"

@interface IP4APIWrapperTests : XCTestCase

@end

@implementation IP4APIWrapperTests

- (void)testAPIWrapperMustReturnNilWithNilBaseURL {
    IP4APIWrapper *apiWrapper = [[IP4APIWrapper alloc] init];
    
    
    
    [apiWrapper IP4sWithBaseURL:nil completion:^(NSString * _Nullable data) {
        NSLog(@"ok");

        XCTAssertNil(data);
    } onError:^(NSError * _Nullable error) {
        NSLog(@"error");
    }];
    
}


- (void)testAPIWrapperWithOneIP {
    IP4APIWrapper *apiWrapper = [[IP4APIWrapper alloc] init];

    //[apiWrapper IP4sWithBaseURL:nil completion:^(NSString * _Nullable data) {
    [apiWrapper IP4sWithBaseURL:@"http://www.telize.com/geoip/68.0.2.1" completion:^(NSString * _Nullable data) {
        NSLog(@"ok");
        
        XCTAssertNotNil(data);
        
        
//        IP4JSON *json = [JSONParser parseJSONString:data];
        
    } onError:^(NSError * _Nullable error) {
        NSLog(@"error");
    }];
    
}

@end

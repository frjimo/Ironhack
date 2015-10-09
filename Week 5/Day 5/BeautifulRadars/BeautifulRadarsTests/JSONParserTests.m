#import <XCTest/XCTest.h>
#import "JSONParser.h"
#import "StubFileUtil.h"
#import "NSDate+DFFormatter.h"

@interface JSONParserTests : XCTestCase

@end

@implementation JSONParserTests

- (void)testJSONParserShouldReturnNilWhenPassedAnEmptyJSONString {
    
    NSArray<RadarJSON *> *radars = [JSONParser parseJSONString:@""];
    XCTAssertNil(radars);
}

- (void)testJSONParserShouldReturnOneRadarWhenPassedAJSONStringWithOneRadar {
    NSString *stub = [StubFileUtil loadStubFileNamed:@"OneRadarResultStub"];
    
    NSArray<RadarJSON *> *radars = [JSONParser parseJSONString:stub];
    XCTAssertNotNil(radars);
    XCTAssertEqual(1, radars.count);
}

- (void)testJSONParserShouldReturnNilWhenPassedAJSONStringWithEmptyRadars {
    NSString *stub = [StubFileUtil loadStubFileNamed:@"EmptyRadarsArrayStub"];
    
    NSArray<RadarJSON *> *radars = [JSONParser parseJSONString:stub];
    XCTAssertEqual(0, radars.count);
}

#define TITLE_TEST @"Multipeer Connectivity for tvOS"
#define DESCRIPTION_TEST @"This is a duplicate of rdar://22786605\n\nSummary:\nThe always connected 4th gen AppleTV with its tvOS is a superb companion for iOS devices. But the connection is severely limited due to its missing MultiPeerConnectivity framework.\n\nExpected Results:\nPlease reconsider and provide the same MultiPeerConnectivity API/framework on tvOS too."

- (void)testJSONParserShouldReturnACorrectRadarWhenPassedAJSONStringWithOneRadar {
    NSString *stub = [StubFileUtil loadStubFileNamed:@"OneRadarResultStub"];
    
    NSArray<RadarJSON *> *radars = [JSONParser parseJSONString:stub];

    RadarJSON *radar = radars[0];
    
    XCTAssertEqualObjects(@"jedi@group6.net", radar.user);
    XCTAssertEqualObjects(TITLE_TEST, radar.title);
    XCTAssertEqualObjects(DESCRIPTION_TEST, radar.radarDescription);

    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    // "2015-10-07 01:53:35.476190",
    components.year = 2015;
    components.month = 10;
    components.day = 7;
    components.hour = 1;
    components.minute = 53;
    components.second = 35.47619;
    // NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    // NSDate *date = [calendar dateFromComponents:components];
    
    // XCTAssertEqualObjects(date, radar.created);
}











@end

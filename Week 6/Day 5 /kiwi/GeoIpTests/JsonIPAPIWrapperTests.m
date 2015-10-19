#import <XCTest/XCTest.h>
#import "JsonIPAPIWrapper.h"
#import "StubFileUtil.h"

@interface JsonIPAPIWrapperMock : NSObject <GeoIPAPIWebServiceProtocol>
- (void)IPsWithBaseURL:(NSString *)baseURL completion:(EmptyBlock)completion onError:(ErrorBlock)onErrorBlock;
@end

@implementation JsonIPAPIWrapperMock

- (void)IPsWithBaseURL:(NSString *)baseURL completion:(EmptyBlock)completion onError:(ErrorBlock)onErrorBlock {
    if (!baseURL) {
        onErrorBlock == nil ? : onErrorBlock(nil);
        return;
    }
    
    NSString *json = [StubFileUtil loadStubFileNamed:@"GeoIpCorrectResponse"];
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    completion == nil ? : completion([[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

@end

@interface JsonIPAPIWrapperTests : XCTestCase

@end

@implementation JsonIPAPIWrapperTests
- (void)testJsonAPIWrapperReturnsNilWhenPassedNilURL {
    JsonIPAPIWrapper *wrapper = [[JsonIPAPIWrapper alloc] init];
    
    [wrapper IPsWithBaseURL:nil completion:nil onError:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testJsonAPIWrapperReturnsSomethingWhenPassedNonNilURLAndTheresNoError {
    JsonIPAPIWrapperMock *wrapper = [[JsonIPAPIWrapperMock alloc] init];
    
    [wrapper IPsWithBaseURL:@"http://www.telize.com/geoip/68.0.2.1" completion:^(NSString * _Nullable data) {
        XCTAssertNotNil(data);
    } onError:^(NSError * _Nullable error) {
        XCTAssertTrue(false);
    }];
}

@end

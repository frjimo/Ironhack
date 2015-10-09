#import <Foundation/Foundation.h>

@protocol RadarAPIWebServiceProtocol <NSObject>
@required

- (void)radarsWithBaseURL:( NSString * _Nonnull )baseURL completion:(void (^ _Nullable)(NSString * _Nullable))completion onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock;

@optional
@end

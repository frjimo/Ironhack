#import <Foundation/Foundation.h>
#import "RadarAPIWebServiceProtocol.h"

@interface RadarAPIWrapper : NSObject <RadarAPIWebServiceProtocol>

/**
 ⚡️radarsWithBaseURL:completion:onError:
 Awesome method that fetches some rdars from the internets, such awesome, very good, wow
 */
- (void)radarsWithBaseURL:( NSString * _Nonnull )baseURL completion:(void (^ _Nullable)(NSString * _Nullable))completion onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock;
@end

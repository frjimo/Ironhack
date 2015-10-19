#import <Foundation/Foundation.h>
#import "GeoIPAPIWebServiceProtocol.h"

@interface JsonIPAPIWrapper : NSObject <GeoIPAPIWebServiceProtocol>

/**
 ⚡️radarsWithBaseURL:completion:onError:
 Awesome method that fetches some rdars from the internets, such awesome, very good, wow
 */
- (void)IPsWithBaseURL:( NSString * _Nonnull )baseURL completion:(EmptyBlock)completion onError:(ErrorBlock)onErrorBlock;


@end

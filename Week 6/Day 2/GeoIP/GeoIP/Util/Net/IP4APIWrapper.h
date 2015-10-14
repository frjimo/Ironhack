#import <Foundation/Foundation.h>
#import "IP4APIWebServiceProtocol.h"

@interface IP4APIWrapper : NSObject <IP4APIWrapperAPIWebServiceProtocol>

/**
 ⚡️radarsWithBaseURL:completion:onError:
 Awesome method that fetches some rdars from the internets, such awesome, very good, wow
 */
- (void)IP4sWithBaseURL:( NSString * _Nonnull )baseURL completion:(void (^ _Nullable)(NSString * _Nullable))completion onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock;
@end

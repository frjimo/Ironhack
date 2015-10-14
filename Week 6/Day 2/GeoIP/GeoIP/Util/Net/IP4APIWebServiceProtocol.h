#import <Foundation/Foundation.h>

@protocol IP4APIWrapperAPIWebServiceProtocol <NSObject>
@required

- (void)IP4sWithBaseURL:( NSString * _Nonnull )baseURL completion:(void (^ _Nullable)(NSString * _Nullable))completion onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock;

@optional
@end

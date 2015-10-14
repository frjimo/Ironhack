#import <Foundation/Foundation.h>

typedef void (^ _Nullable EmptyBlock)(NSString * _Nullable);
typedef void (^ _Nullable ErrorBlock)(NSError * _Nullable);

@protocol GeoIPAPIWebServiceProtocol <NSObject>
@required

- (void)IPsWithBaseURL:( NSString * _Nonnull )baseURL completion:(EmptyBlock)completion onError:(ErrorBlock)onErrorBlock;

@optional
@end

#import <Foundation/Foundation.h>

@interface RandomIPAddressGenerator : NSObject

+ (NSString *)randomIp;

+ (NSArray<NSString *> *)randomIpsWithCapacity:(NSUInteger)capacity;

@end

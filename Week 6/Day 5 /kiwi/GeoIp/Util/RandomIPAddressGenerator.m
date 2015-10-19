#import "RandomIPAddressGenerator.h"

@implementation RandomIPAddressGenerator

+ (NSString *)randomIp {
    NSString *ip;
    
    NSUInteger ip1 = arc4random() % 256;
    NSUInteger ip2 = arc4random() % 256;
    NSUInteger ip3 = arc4random() % 256;
    NSUInteger ip4 = arc4random() % 256;
    
    ip = [NSString stringWithFormat:@"%lu.%lu.%lu.%lu", ip1, ip2, ip3, ip4];
    
    return ip;
}

+ (NSArray<NSString *> *)randomIpsWithCapacity:(NSUInteger)capacity {
    
    if (capacity == 0) {
        return nil;
    }
    
    NSMutableArray<NSString *> *ips = [[NSMutableArray alloc] init];
    
    for (int i=0; i<capacity; i++) {
        ips[i] = [self randomIp];
    }
    
    return ips;
}

@end

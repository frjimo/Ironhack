#import <Foundation/Foundation.h>

@interface GeoIPJSON : NSObject

@property (nonatomic, copy) NSString *asn;
@property (nonatomic, copy) NSString *area_code;
@property (nonatomic, copy) NSString *continent_code;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *classification;
@property (nonatomic, copy) NSString *country_code;
@property (nonatomic, copy) NSString *country_code3;
@property (nonatomic, copy) NSString *dma_code;
@property (nonatomic, copy) NSString *ip;
@property (nonatomic, copy) NSString *isp;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;

@end

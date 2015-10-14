//
//  IP4JSON.h
//  GeoIP
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IpJSON : NSObject

@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *ip;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;


@property (nonatomic, copy) NSString *asn;
@property (nonatomic, copy) NSString *country_code;
@property (nonatomic, copy) NSString *area_code;
@property (nonatomic, copy) NSString *country_code3;
@property (nonatomic, copy) NSString *continent_code;
@property (nonatomic, copy) NSString *isp;
@property (nonatomic, copy) NSString *dma_code;

@end

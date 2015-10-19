//
//  RandomIPGeneratorSpec.m
//  GeoIp
//
//  Created by Fran on 16/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RandomIPAddressGenerator.h"
#import <ObjectiveSugar/ObjectiveSugar.h>

SPEC_BEGIN(RandomIPGeneratorSpec)

describe(@"When using Random IP Generator", ^{
    it(@"after creation it returns a non-nil object", ^{
        
        NSString *sut = [RandomIPAddressGenerator randomIp];
        [[sut shouldNot]beNil];

    });
    
    it(@"should store the IP address", ^{
        NSArray *sut = [RandomIPAddressGenerator randomIpsWithCapacity:10];
        [[sut shouldNot]beNil];
        [[@(sut.count) should] equal:@10];
        
        [@10 timesWithIndex:^(int index) {
            
        }];
    });
});

SPEC_END

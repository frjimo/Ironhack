//
//  IP4Generator.h
//  GeoIP
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IP4Generator : NSObject

- (NSMutableArray <NSString *>*)nIPAdress:(NSUInteger)n;
- (NSString *)IP4addresses;


@end

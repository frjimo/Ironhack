//
//  JSONParser.h
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 7/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IpJSON.h"

@interface GeoIPJSONParser : NSObject

+ (IpJSON *)parseJSONString:(NSString *)jsonAsString;

@end



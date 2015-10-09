//
//  JSONParser.h
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 7/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RadarJSON.h"

@interface JSONParser : NSObject

+ (NSArray<RadarJSON *> *)parseJSONString:(NSString *)jsonAsString;

@end



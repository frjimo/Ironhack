//
//  JSONRadarMapper.h
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 8/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IP4.h"
#import "IpJSON.h"

@interface JSONIP4Mapper : NSObject

+ (IP4 *)mapJSONIP4s:(IpJSON *)jsonIP4s inContext:(NSManagedObjectContext *)context;

@end

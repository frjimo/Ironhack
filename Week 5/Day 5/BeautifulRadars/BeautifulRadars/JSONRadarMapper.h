//
//  JSONRadarMapper.h
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 8/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Radar.h"
#import "RadarJSON.h"

@interface JSONRadarMapper : NSObject

+ (NSArray<Radar *>*)mapJSONRadars:(NSArray<RadarJSON *>*)jsonRadars inContext:(NSManagedObjectContext *)context;

@end

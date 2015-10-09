//
//  JSONRadarMapper.m
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 8/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "JSONRadarMapper.h"

@implementation JSONRadarMapper

+ (NSArray<Radar *>*)mapJSONRadars:(NSArray<RadarJSON *>*)jsonRadars inContext:(NSManagedObjectContext *)context {
    
    NSMutableArray<Radar *> *radars = [NSMutableArray arrayWithCapacity:jsonRadars.count];
    
    for (RadarJSON *radarJSON in jsonRadars) {
        Radar *radar = [Radar radarWithUser:radarJSON.user andTitle:radarJSON.title inContext:context];
        [radars addObject:radar];
    }
    
    NSError *error;
    [context save:&error];
    if (error) {
        return nil;
    }
    
    return radars;
}

@end

//
//  JSONParser.h
//  Radar
//
//  Created by Fran on 7/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class Radar;
//@class NSManagedObjectContext;
#import "Radar.h"

@interface JSONParser : NSObject

+ (NSArray<Radar *> *)parseJSONString:(NSString *)jsonAsString usingContext:(NSManagedObjectContext *)context;

@end

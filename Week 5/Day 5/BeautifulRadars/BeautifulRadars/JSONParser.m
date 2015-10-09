//
//  JSONParser.m
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 7/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "JSONParser.h"
#import "NSDate+DFFormatter.h"

@implementation JSONParser

+ (NSArray<RadarJSON *> *)parseJSONString:(NSString *)jsonAsString {
    NSData *data = [jsonAsString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        return nil;
    }
    
    NSMutableArray<RadarJSON *> *radars = [[NSMutableArray alloc] initWithCapacity:100];
    
    NSArray *jsonRadars = [jsonData objectForKey:@"result"];
    
    for (NSDictionary *dict in jsonRadars) {
     
        NSString *number = dict[@"number"];
        NSString *radarId = dict[@"id"];
        NSString *classification = dict[@"classification"];
        NSString *created = dict[@"created"];
        NSString *modified = dict[@"modified"];
        NSString *reproducible = dict[@"reproducible"];
        
        RadarJSON *radarJSON = [[RadarJSON alloc] init];
        radarJSON.user = dict[@"user"];
        radarJSON.title = dict[@"title"];
        radarJSON.resolved = dict[@"resolved"];
        radarJSON.status = dict[@"status"];
        radarJSON.product = dict[@"product"];
        radarJSON.radarDescription = dict[@"description"];
        radarJSON.parent = dict[@"parent"];
        radarJSON.originated = dict[@"originated"];
        radarJSON.product_version = dict[@"originated"];
        
        radarJSON.created = [[[NSDate alloc] init] parseModifiedCreatedDateAsString:dict[@"created"]];
        
        [radars addObject:radarJSON];
    }
    
    return radars;
}


@end

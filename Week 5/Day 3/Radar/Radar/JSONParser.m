//
//  JSONParser.m
//  Radar
//
//  Created by Fran on 7/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "JSONParser.h"
//#import "Radar.h"

@implementation JSONParser

+ (NSArray<Radar *> *)parseJSONString:(NSString *)jsonAsString usingContext:(NSManagedObjectContext *)context {
    NSData *data = [jsonAsString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    
    if(error){
        return nil;
    }
    
    NSMutableArray <Radar *> *radars = [[NSMutableArray alloc]initWithCapacity:100];
    NSArray *jsonRadars = [jsonData objectForKey:@"result"];
    
    for (NSDictionary *dict in jsonRadars) {
        NSString *user = [dict objectForKey:@"user"];
        NSString *title = dict[@"title"];
        
        Radar * radar = [Radar radarWithUser:user andTitle:title inContext:context];
        
        [radars addObject:radar];
        
        //Radar *radar = [[Radar alloc] initWithEntity:[NSEntityDescription entityForName:[Radar description] inManagedObjectContext:context] insertIntoManagedObjectContext:context];
    }
    return radars;
}

@end

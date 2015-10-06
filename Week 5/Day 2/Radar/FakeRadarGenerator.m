//
//  FakeRadarGenerator.m
//  Radar
//
//  Created by Fran on 6/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "FakeRadarGenerator.h"
#import "Radar.h"
#import "NSString+Random.h"
#import "NSManagedObjectContext+FJInsertManagedObject.h"



@implementation FakeRadarGenerator

- (BOOL)generateRadarsInContext:(NSManagedObjectContext *)context{
    for (int i= 0; i< 10; i++){
        Radar *radar = (Radar *)[context insertNewObjectForEntityForName:[Radar description]];
        radar.user = @"frjimo@gmail.com";
        radar.title = [NSString mm_randomString];
    }
    NSError *error;
    [context save:&error];
    
    return (error = nil) ? YES : NO;
}

@end

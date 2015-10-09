//
//  FakeRadarGenerator.m
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 6/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "FakeRadarGenerator.h"
#import "NSManagedObjectContext+DFInsertManagedObject.h"

@implementation FakeRadarGenerator

- (BOOL)generateRadarsInContext:(NSManagedObjectContext *)context {
    for (int i = 0; i < 10; i++) {
        Radar *sut = (Radar *)[context insertNewObjectForEntityForName:[Radar description]];
        sut.title = @"Radar title";
        sut.user = @"tim@apple.com";
    }
    
    NSError *error;
    [context save:&error];
    
    return (error == nil) ? YES : NO;
}


@end

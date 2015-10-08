//
//  Radar.m
//  Radar
//
//  Created by Fran on 6/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "Radar.h"
#import "NSManagedObjectContext+FJInsertManagedObject.h"

@implementation Radar

// Insert code here to add functionality to your managed object subclass

+ (Radar *)radarWithUser:(NSString *)user andTitle:(NSString *)title inContext:(NSManagedObjectContext *)context {
    Radar *radar = (Radar *)[context insertNewObjectForEntityForName:[Radar description]];
    
    [radar setTitle:title];
    [radar setUser:user];
    
    return radar;
}
    


@end

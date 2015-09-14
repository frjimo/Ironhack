//
//  Hotel.h
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Hotel : NSObject

- (NSString *)addPerson:(Person *)person;
- (Person *)personForRoom:(NSString *)roomKey;
- (NSUInteger)totalRooms;
- (NSArray *)allRooms;


@end

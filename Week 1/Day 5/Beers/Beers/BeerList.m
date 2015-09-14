//
//  BeerList.m
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "BeerList.h"

#import "Beer.h"

@interface BeerList ()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation BeerList

- (NSMutableArray *)list {
    if (!self.list) {
        self.list = [NSMutableArray new];
    }
    return self.list;
}

- (void)addBeer:(Beer *)beer {
    [self.list addObject:beer];
}

- (void)removeBeer:(Beer *)beer {
    [self.list removeObject:beer];
}

- (NSArray *)allBeers {
    return [self.list copy];
}

- (NSUInteger)totalBeers {
    return [self.list count];
}

@end

//
//  BeerList.h
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Beer;

@interface BeerList : NSObject

- (void)addBeer:(Beer *)beer;
- (void)removeBeer:(Beer *)beer;
- (NSArray *)allBeers;
- (NSUInteger)totalBeers;

@end

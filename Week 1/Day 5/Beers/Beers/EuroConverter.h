//
//  EuroConverter.h
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface EuroConverter : NSObject

@property (nonatomic, assign) CGFloat money;

+ (int)convertFromEuroToPeseta:(float)euros;
+ (float)convertFromPesetaToEuro:(int)pesetas;


- (int)convertFromEuroToPeseta;
- (float)convertFromPesetaToEuro;


@end

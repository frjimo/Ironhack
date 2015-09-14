//
//  Beer.h
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Beer : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, assign) NSUInteger grade;


+ (instancetype)beerWithName:(NSString*)name color:(NSString *)color grade:(NSInteger )grade;
- (instancetype)initWithName:(NSString*)name color:(NSString *)color grade:(NSInteger )grade NS_DESIGNATED_INITIALIZER;
- (void)printBeerInfo;


@end

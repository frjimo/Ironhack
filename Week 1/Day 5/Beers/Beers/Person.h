//
//  Person.h
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *address;
@property (nonatomic) NSUInteger age;
@property (nonatomic, getter=isMarried) BOOL married;


+ (instancetype)personWithName:(NSString *)name;

+ (instancetype)personWithName:(NSString *)name address:(NSString *)address;

- (instancetype)initWithName:(NSString *)name;

- (instancetype)initWithName:(NSString *)name address:(NSString *)address;

- (instancetype)initWithName:(NSString *)name address:(NSString *)address age:(NSInteger)age NS_DESIGNATED_INITIALIZER;


@end

//
//  Person.m
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "Person.h"

@implementation Person


+ (instancetype)personWithName:(NSString *)name {
    //return [[self alloc] initWithName:name];
    return [self personWithName:name address:nil];
    ;}

+ (instancetype)personWithName:(NSString *)name address:(NSString *)address {
    return [[self alloc] initWithName:name address:address];
}

- (instancetype)initWithName:(NSString *)name {
    //return [self initWithName:name address:nil age:0];
    return [self initWithName:name address:nil];
}

- (instancetype)initWithName:(NSString *)name address:(NSString *)address {
    //return [self initWithName:name address:address age:0];
    return [self initWithName:name address:address age:0];
}

- (instancetype)initWithName:(NSString *)name address:(NSString *)address age:(NSInteger)age {
    self = [super init];
    
    if(self){
        self.name = name ;
        self.address = address;
        self.age = age;
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"Name:%@, Address:%@, Age:%lu Married:%@\n", self.name, self.address, (unsigned long)self.age, self.married ? @"Yes" : @"No"];
    //return [NSString stringWithFormat:@"Name:%@, Address:%@, Age:%lu Married:%d\n", self.name, self.address, (unsigned long)self.age, self.married];
}

@end

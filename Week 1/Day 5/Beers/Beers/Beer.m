//
//  Beer.m
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "Beer.h"

@implementation Beer

- (void)printBeerInfo{
    NSLog(@"Name: %@ Color:%@ Grade:%lu\n",self.name, self.color, self.grade);
}

+ (instancetype)beerWithName:(NSString*)name color:(NSString *)color grade:(NSInteger )grade
{
    return [[self alloc] beerWithName:name color:color grade:grade];
}


- (instancetype)initWithName:(NSString*)name color:(NSString *)color grade:(NSInteger )grade{
    
    self = [super init];
    
    if(self){
        self.name = name;
        self.color = color;
        self.grade = grade;
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"Name:%@, Color:%@, Grade:%lu \n", self.name, self.color, self.grade];
}


@end

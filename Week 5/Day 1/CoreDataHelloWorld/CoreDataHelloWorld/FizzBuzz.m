//
//  FizzBuzz.m
//  CoreDataHelloWorld
//
//  Created by Fran on 5/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "FizzBuzz.h"

@implementation FizzBuzz

+ (NSString *)fizzBuzz:(NSUInteger)number{
    if (number % 3 == 0 && number % 5 == 0){
        return @"FizzBuzz";
    }
    if (number % 5 == 0){
        return @"Buzz";
    }
    if (number % 3 == 0){
        return @"Fizz";
    }
    
    

    return [NSString stringWithFormat:@"%lu", (unsigned long)number];
}

@end

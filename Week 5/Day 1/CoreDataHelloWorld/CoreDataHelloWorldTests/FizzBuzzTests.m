//
//  FizzBuzzTests.m
//  CoreDataHelloWorld
//
//  Created by Fran on 5/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FizzBuzz.h"

@interface FizzBuzzTests : XCTestCase

@end

@implementation FizzBuzzTests

- (void)testFizzBuzzShouldReturnOneWhenPassedOne {
    NSString *sut = [FizzBuzz fizzBuzz:1];
    
    XCTAssertEqualObjects(@"1", sut);
}

- (void)testFizzBuzzShouldReturnTwoWhenPassedTwo {
    NSString *sut = [FizzBuzz fizzBuzz:2];
    
    XCTAssertEqualObjects(@"2", sut);
}

- (void)testFizzBuzzShouldReturnFizzWhenPassedThree {
    NSString *sut = [FizzBuzz fizzBuzz:3];
    
    XCTAssertEqualObjects(@"Fizz", sut);
}

- (void)testFizzBuzzShouldReturnBuzzWhenPassedFive {
    NSString *sut = [FizzBuzz fizzBuzz:5];
    
    XCTAssertEqualObjects(@"Buzz", sut);
}

- (void)testFizzBuzzShouldReturnFizzWhenPassedSix {
    NSString *sut = [FizzBuzz fizzBuzz:6];
    
    XCTAssertEqualObjects(@"Fizz", sut);
}

- (void)testFizzBuzzShouldReturnFizzWhenPassedTen {
    NSString *sut = [FizzBuzz fizzBuzz:10];
    
    XCTAssertEqualObjects(@"Buzz", sut);
}

- (void)testFizzBuzzShouldReturnFizzBuzzWhenPassedFifteen {
    NSString *sut = [FizzBuzz fizzBuzz:15];
    
    XCTAssertEqualObjects(@"FizzBuzz", sut);
}


@end

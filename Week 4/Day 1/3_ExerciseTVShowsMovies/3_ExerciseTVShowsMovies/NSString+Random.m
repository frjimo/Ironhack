//
//  NSString+Random.m
//  3_ExerciseTVShowsMovies
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "NSString+Random.h"

@implementation NSString (Random)

+ (NSString *)mm_randomString
{
    NSString *randomString=@"";
    NSInteger numberOfLetters=arc4random_uniform(10) + 4;
    for (NSInteger i=0; i<numberOfLetters; i++) {
        randomString = [randomString stringByAppendingString:[NSString stringWithFormat:@"%c", arc4random_uniform(26) + 'a']];
    }
    
    return randomString;
}

@end

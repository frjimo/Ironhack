//
//  NSArray+Random.m
//  3_ExerciseTVShowsMovies
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)

- (id)mm_randomObject
{
    id randomObject = [self count] ? self[arc4random_uniform((u_int32_t)[self count])] : nil;
    return randomObject;
}

@end

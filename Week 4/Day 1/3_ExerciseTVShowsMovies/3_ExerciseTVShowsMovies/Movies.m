//
//  Movies.m
//  3_ExerciseTVShowsMovies
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "Movies.h"

@implementation Movies

- (instancetype)initWithid:(NSString *)movieId description:(NSString *)movieDescription title:(NSString *)movieTitle rating:(CGFloat)movieRating{
    
    self = [super init];
    if (self) {
        self.movieId = movieId;
        self.movieDescription = movieDescription;
        self.movieTitle = movieTitle;
        self.movieRating = movieRating;
    }
    return self;
    
}

- (id)copyWithZone:(NSZone *)zone {
    Movies *movie = [[Movies alloc]initWithid:[self.movieId copyWithZone:zone] description:[self.movieDescription copyWithZone:zone] title:[self.movieTitle copyWithZone:zone] rating:self.movieRating];
    
    return movie;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self) {
        self.movieId = [aDecoder decodeObjectForKey:@"labelId"];
        self.movieDescription = [aDecoder decodeObjectForKey:@"labelDescription"];
        self.movieTitle = [aDecoder decodeObjectForKey:@"labelTitle"];
        self.movieRating = [aDecoder decodeFloatForKey:@"labelRating"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.movieId forKey:@"labelId"];
    [aCoder encodeObject:self.movieDescription forKey:@"labelDescription"];
    [aCoder encodeObject:self.movieTitle forKey:@"labelTitle"];
    [aCoder encodeFloat:self.movieRating forKey:@"labelRating"];

}

- (BOOL)isEqualBookmark:(Movies *)other {
    //return ([self.name isEqualToString:other.name] && [self.url isEqualToString: other.url]);
    return ([self.movieTitle isEqualToString: other.movieTitle]);
}


- (BOOL)isEqual:(id)other
{
    if (self == other){
        return YES;
    }
    if (![other isKindOfClass:[self class]]){
        return NO;
    }
    return [self isEqualBookmark:(Movies *)other];
}

- (NSUInteger)hash
{
    return [_movieTitle hash];
}


@end

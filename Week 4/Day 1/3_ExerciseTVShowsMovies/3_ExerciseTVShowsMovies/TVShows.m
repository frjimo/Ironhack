//
//  TVShows.m
//  3_ExerciseTVShowsMovies
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "TVShows.h"

@implementation TVShows

- (instancetype)initWithid:(NSString *)showId description:(NSString *)showDescription title:(NSString *)showTitle rating:(CGFloat)showRating{
    
    
    self = [super init];
    if (self) {
        self.showId = showId;
        self.showDescription = showDescription;
        self.showTitle = showTitle;
        self.showRating = showRating;
    }
    return self;
    
}


- (id)copyWithZone:(NSZone *)zone {
    TVShows *show = [[TVShows alloc]initWithid:[self.showId copyWithZone:zone] description:[self.showDescription copyWithZone:zone] title:[self.showTitle copyWithZone:zone] rating:self.showRating];
    
    return show;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self) {
        self.showId = [aDecoder decodeObjectForKey:@"labelId"];
        self.showDescription = [aDecoder decodeObjectForKey:@"labelDescription"];
        self.showTitle = [aDecoder decodeObjectForKey:@"labelTitle"];
        self.showRating = [aDecoder decodeFloatForKey:@"labelRating"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.showId forKey:@"labelId"];
    [aCoder encodeObject:self.showDescription forKey:@"labelDescription"];
    [aCoder encodeObject:self.showTitle forKey:@"labelTitle"];
    [aCoder encodeFloat:self.showRating forKey:@"labelRating"];
    
}

- (BOOL)isEqualBookmark:(TVShows *)other {
    //return ([self.name isEqualToString:other.name] && [self.url isEqualToString: other.url]);
    return ([self.showTitle isEqualToString: other.showTitle]);
}


- (BOOL)isEqual:(id)other
{
    if (self == other){
        return YES;
    }
    if (![other isKindOfClass:[self class]]){
        return NO;
    }
    return [self isEqualBookmark:(TVShows *)other];
}

- (NSUInteger)hash
{
    return [_showTitle hash];
}

@end

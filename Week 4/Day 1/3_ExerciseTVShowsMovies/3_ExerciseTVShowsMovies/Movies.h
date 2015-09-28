//
//  Movies.h
//  3_ExerciseTVShowsMovies
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Movies : NSObject <NSCopying, NSCoding>

@property (nonatomic, strong) NSString * movieId;
@property (nonatomic, strong) NSString * movieDescription;
@property (nonatomic, strong) NSString * movieTitle;
@property (nonatomic, assign) CGFloat movieRating;

- (instancetype)initWithid:(NSString *)movieId description:(NSString *)movieDescription title:(NSString *)movieTitle rating:(CGFloat)movieRating;

@end

//
//  TVShows.h
//  3_ExerciseTVShowsMovies
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface TVShows : NSObject <NSCopying>

@property (nonatomic, strong) NSString * showId;
@property (nonatomic, strong) NSString * showDescription;
@property (nonatomic, strong) NSString * showTitle;
@property (nonatomic, assign) CGFloat showRating;

- (instancetype)initWithid:(NSString *)showId description:(NSString *)showDescription title:(NSString *)showTitle rating:(CGFloat)showRating;

@end

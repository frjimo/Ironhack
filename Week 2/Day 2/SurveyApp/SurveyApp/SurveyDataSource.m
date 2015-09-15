//
//  SurveyDataSource.m
//  SurveyApp
//
//  Created by Fran on 15/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "SurveyDataSource.h"

@implementation SurveyDataSource

- (NSDictionary *)fetchSurvey {
    return @{@"preguntas":@[
                     @{@"cual es tu comida favorita?" : @[@"paella", @"tortilla", @"hamburguesa"]},
                     @{@"cual es tu cerveza favorita?" : @[@"mahou", @"estrella de galicia"]},
                     @{@"que postura usas para dormir?" : @[@"boca arriba", @"boca abajo", @"de lado"]},
                     @{@"donde te gustaria ir de vacaciones?" : @[@"Nueva York", @"Bora bora", @"Australia"]}
                     ]
             };
}

@end

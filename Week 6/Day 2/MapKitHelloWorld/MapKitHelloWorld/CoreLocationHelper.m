//
//  CoreLocationHelper.m
//  MapKitHelloWorld
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "CoreLocationHelper.h"

@implementation CoreLocationHelper

+ (BOOL)isLocationServiceAuthorizedByUser {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        return YES;
    }
    
    return NO;
}

@end

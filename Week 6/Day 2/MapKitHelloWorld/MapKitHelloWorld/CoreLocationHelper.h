//
//  CoreLocationHelper.h
//  MapKitHelloWorld
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CoreLocationHelper : NSObject

+ (BOOL)isLocationServiceAuthorizedByUser;

@end

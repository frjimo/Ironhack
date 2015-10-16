//
//  GeoIPPin.h
//  GeoIp
//
//  Created by Diego Freniche Brito on 14/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface GeoIPPin : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;

@end

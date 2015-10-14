//
//  MapHelper.m
//  GeoIp
//
//  Created by Diego Freniche Brito on 14/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "MapHelper.h"
#import "GeoIPPin.h"

@implementation MapHelper

+ (void)centerMap:(MKMapView *)map onLatitude:(float)latitude andLongitude:(float)longitude {
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(latitude, longitude);
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(center, 1000, 1000);
    MKCoordinateRegion adjustedRegion = [map regionThatFits:region];
    [map setRegion:adjustedRegion animated:YES];
}

+ (void)addPinToMap:(MKMapView *)map onLatitude:(float)latitude andLongitude:(float)longitude {
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(latitude, longitude);
    GeoIPPin *pin = [[GeoIPPin alloc] init];
    
    pin.coordinate = center;
    [map addAnnotation:pin];
}

+ (void)clearAllAnnotationsInMap:(MKMapView *)map {
    [map removeAnnotations:[map annotations]];
}


@end

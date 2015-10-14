//
//  MapViewController.m
//  GeoIp
//
//  Created by Diego Freniche Brito on 14/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "MapViewController.h"
#import "MapHelper.h"
#import <CoreData/CoreData.h>
#import "GeoIP.h"

@interface MapViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.map.delegate = self;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(putPinsOnMap) name:NSManagedObjectContextObjectsDidChangeNotification object:nil];
    
    [self putPinsOnMap];
    
    
}

- (void)putPinsOnMap {
    [MapHelper clearAllAnnotationsInMap:self.map];
    
    NSFetchRequest *query = [GeoIP fetchRequestWithFields:@[@"ip", @"country", @"latitude", @"longitude"] andOrders:@[@YES, @YES, @YES, @YES]];
    NSArray *geoPoints = [self.context executeFetchRequest:query error:nil];
    
    for (GeoIP *geoIp in geoPoints) {
        [MapHelper addPinToMap:self.map onLatitude:geoIp.latitudeValue andLongitude:geoIp.longitudeValue];
    }
}



@end

//
//  ViewController.m
//  MapKitHelloWorld
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "CoreLocationHelper.h"
#import "MapPin.h"

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *centerMap;

@property (nonatomic) CLLocationCoordinate2D currentLocation;
@property (nonatomic) CLLocationCoordinate2D lastPosition;


@end

#define CENTER_LATITUDE 37.779279
#define CENTER_LONGITUDE -3.785020

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self loadLocationManager];
    [self printCoordenadas];
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(CENTER_LATITUDE, CENTER_LONGITUDE);
    MapPin *pin = [[MapPin alloc]init];
    [pin setCoordinate:center];
    [self.map addAnnotation:pin];
    
    
}

- (void)loadLocationManager {
    self.locationManager = [[CLLocationManager alloc]init];
    [self.locationManager requestWhenInUseAuthorization];
    self.map.delegate = self;
    
//    self.locationManager.delegate = self;
//    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    
//    [self.locationManager startUpdatingLocation];

    
}

-(void)mapViewWillStartLoadingMap:(MKMapView *)mapView{
    NSLog(@"Starting");
}

-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
    NSLog(@"Finishing");
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    self.lastPosition = userLocation.location.coordinate;
    self.latitudeLabel.text = [NSString stringWithFormat:@"Latitude: %f",userLocation.location.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"Longitude: %f",userLocation.location.coordinate.longitude];
}

- (void)printCoordenadas {
    self.latitudeLabel.text = [NSString stringWithFormat:@"Latitude: %f",self.map.centerCoordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"Longitude: %f",self.map.centerCoordinate.longitude];
}
- (IBAction)centerMap:(id)sender {
//    CLLocationCoordinate2D jaen;
//    jaen.latitude = CENTER_LATITUDE;
//    jaen.longitude = CENTER_LONGITUDE;
    
    self.lastPosition = self.map.centerCoordinate;
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(CENTER_LATITUDE, CENTER_LONGITUDE);
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(center, 1000.0, 1000.0);
    MKCoordinateRegion adjustedRegion = [self.map regionThatFits:region];
    
    [self.map setRegion:adjustedRegion animated:YES];
}

- (IBAction)viewSat:(id)sender {
    self.map.mapType = MKMapTypeSatellite;
}

- (IBAction)viewHybrid:(id)sender {
    self.map.mapType = MKMapTypeHybrid;
}

- (IBAction)viewNor:(id)sender {
    self.map.mapType = MKMapTypeStandard;
}

- (IBAction)backButton:(id)sender {
    CLLocationCoordinate2D center = self.lastPosition;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(center, 1000.0, 1000.0);
    MKCoordinateRegion adjustedRegion = [self.map regionThatFits:region];
    
    [self.map setRegion:adjustedRegion animated:YES];
}
@end

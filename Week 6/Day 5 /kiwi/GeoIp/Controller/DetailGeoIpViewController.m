#import "DetailGeoIpViewController.h"
#import <MapKit/MapKit.h>
#import "MapHelper.h"

@interface DetailGeoIpViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation DetailGeoIpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.map.delegate = self;
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    [MapHelper centerMap:self.map onLatitude:self.ip.latitudeValue andLongitude:self.ip.longitudeValue];
    
    [MapHelper clearAllAnnotationsInMap:self.map];
    
    [MapHelper addPinToMap:self.map onLatitude:self.ip.latitudeValue andLongitude:self.ip.longitudeValue];
}

@end

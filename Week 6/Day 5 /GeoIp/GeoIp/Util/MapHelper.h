#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapHelper : NSObject

+ (void)centerMap:(MKMapView *)map onLatitude:(float)latitude andLongitude:(float)longitude;
+ (void)addPinToMap:(MKMapView *)map onLatitude:(float)latitude andLongitude:(float)longitude;
+ (void)clearAllAnnotationsInMap:(MKMapView *)map;
@end

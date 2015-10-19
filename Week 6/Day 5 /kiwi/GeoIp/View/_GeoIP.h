// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GeoIP.h instead.

#import <CoreData/CoreData.h>


extern const struct GeoIPAttributes {
	__unsafe_unretained NSString *country;
	__unsafe_unretained NSString *ip;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
} GeoIPAttributes;

extern const struct GeoIPRelationships {
} GeoIPRelationships;

extern const struct GeoIPFetchedProperties {
} GeoIPFetchedProperties;







@interface GeoIPID : NSManagedObjectID {}
@end

@interface _GeoIP : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GeoIPID*)objectID;





@property (nonatomic, strong) NSString* country;



//- (BOOL)validateCountry:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* ip;



//- (BOOL)validateIp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* latitude;



@property float latitudeValue;
- (float)latitudeValue;
- (void)setLatitudeValue:(float)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* longitude;



@property float longitudeValue;
- (float)longitudeValue;
- (void)setLongitudeValue:(float)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;






@end

@interface _GeoIP (CoreDataGeneratedAccessors)

@end

@interface _GeoIP (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCountry;
- (void)setPrimitiveCountry:(NSString*)value;




- (NSString*)primitiveIp;
- (void)setPrimitiveIp:(NSString*)value;




- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (float)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(float)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (float)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(float)value_;




@end

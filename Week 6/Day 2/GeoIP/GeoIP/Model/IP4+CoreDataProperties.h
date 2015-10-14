//
//  IP4+CoreDataProperties.h
//  GeoIP
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "IP4.h"

NS_ASSUME_NONNULL_BEGIN

@interface IP4 (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *country;
@property (nullable, nonatomic, retain) NSString *ip;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;

@end

NS_ASSUME_NONNULL_END

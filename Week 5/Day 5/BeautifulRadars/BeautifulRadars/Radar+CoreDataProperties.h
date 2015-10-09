//
//  Radar+CoreDataProperties.h
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 7/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Radar.h"

NS_ASSUME_NONNULL_BEGIN

@interface Radar (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *user;
@property (nullable, nonatomic, retain) NSString *product;
@property (nullable, nonatomic, retain) NSString *product_version;

@end

NS_ASSUME_NONNULL_END

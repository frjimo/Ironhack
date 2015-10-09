//
//  RadarJSON.h
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 8/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RadarJSON : NSObject

@property (nonatomic, copy) NSString *classification;
@property (nonatomic, strong) NSDate *created;
@property (nonatomic, copy) NSString *radarDescription;
@property (nonatomic, strong) NSNumber *radarId;
@property (nonatomic, strong) NSDate *modified;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSDate *originated;
@property (nonatomic, copy) NSString *parent;
@property (nonatomic, strong) NSString *product;
@property (nonatomic, copy) NSString *product_version;
@property (nonatomic, copy) NSString *reproducible;
@property (nonatomic, copy) NSString *resolved;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *user;

@end

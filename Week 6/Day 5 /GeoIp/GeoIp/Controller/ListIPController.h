//
//  ListIPController.h
//  GeoIp
//
//  Created by Diego Freniche Brito on 14/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RotatingTableViewController.h"

@interface ListIPController : RotatingTableViewController
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

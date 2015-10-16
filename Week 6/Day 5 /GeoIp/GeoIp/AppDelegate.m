//
//  AppDelegate.m
//  GeoIp
//
//  Created by Diego Freniche Brito on 13/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataStack.h"
#import "ListIPController.h"
#import "MapViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) CoreDataStack *cds;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.cds = [[CoreDataStack alloc] initWithDatabaseFileName:@"ip.sqlite" andPersistenceType:NSSQLiteStoreType];
    
    UITabBarController *tabBar = (UITabBarController *)self.window.rootViewController;
    UINavigationController *nav = (UINavigationController *)[tabBar viewControllers][0];
    ListIPController *vc = (ListIPController *)nav.topViewController;
    vc.managedObjectContext = self.cds.managedObjectContext;
    
    MapViewController *mapVC = (MapViewController *)[tabBar viewControllers][1];
    mapVC.context = self.cds.managedObjectContext;
    
    return YES;
}



@end

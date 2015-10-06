//
//  AppDelegate.m
//  Radar
//
//  Created by Fran on 6/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataStack.h"

#import "NSString+Random.h"
#import "RadarTableViewController.h"
#import "FakeRadarGenerator.h"

@interface AppDelegate ()

@property (nonatomic, strong) CoreDataStack *cds;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.cds = [[CoreDataStack alloc]initWithDatabaseFileName:@"radars.sqlite" andPersitenceType:NSSQLiteStoreType];
    
    
    [[[FakeRadarGenerator alloc]init] generateRadarsInContext:self.cds.managedObjectContext];
    
    
    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
    RadarTableViewController *controller = (RadarTableViewController *) nav.topViewController;
    controller.managedObjectContext = self.cds.managedObjectContext;
    
//    (
//    (RadarTableViewController *)nav.topViewController
//     ).managedObjectContext
//    =
//    self.cds.managedObjectContext;
    
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self.cds saveContext];
}

@end

//
//  AppDelegate.m
//  GeoIP
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataStack.h"
#import "IP4TableViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) CoreDataStack *cds;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    self.cds = [[CoreDataStack alloc] initWithDatabaseFileName:@"ip4.sqlite" andPersistenceType:NSSQLiteStoreType];
    
    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
    IP4TableViewController *vc = (IP4TableViewController *)nav.topViewController;
    vc.managedObjectContext = self.cds.managedObjectContext;
    
    return YES;
}



@end

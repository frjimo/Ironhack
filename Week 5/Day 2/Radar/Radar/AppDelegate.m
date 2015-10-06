//
//  AppDelegate.m
//  Radar
//
//  Created by Fran on 6/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataStack.h"
#import "ViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) CoreDataStack *cds;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController *controller = [[ViewController alloc]init];
    
    
    self.cds = [[CoreDataStack alloc]initWithDatabaseFileName:@"helloworld.sqlite" andPersitenceType:NSSQLiteStoreType];
    controller.managedObjectContext = self.cds.managedObjectContext;
    
    
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self.cds saveContext];
}

@end

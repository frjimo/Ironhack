//
//  AppDelegate.m
//  UISplitViewController
//
//  Created by Fran on 15/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@property (strong, nonatomic) SecondViewController *secondViewController;
@property (strong, nonatomic) UISplitViewController *splitViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    self.splitViewController = [[UISplitViewController alloc] init];
    FirstViewController *firtViewController = [[FirstViewController alloc] init];
    self.secondViewController = [[SecondViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.secondViewController];
    
    self.splitViewController.viewControllers = @[firtViewController, navigationController];
    self.splitViewController.delegate = self;

    self.window.rootViewController = self.splitViewController;
    [self showButtonIfNeededByDisplayMode:self.splitViewController.displayMode];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    [self showButtonIfNeededByDisplayMode:displayMode];
}

//Para que se muestre la flecha desde el principio
- (void)showButtonIfNeededByDisplayMode:(UISplitViewControllerDisplayMode)displayMode {
    switch (displayMode) {
        case UISplitViewControllerDisplayModePrimaryHidden:
            self.secondViewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
            break;
        default:
            break;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
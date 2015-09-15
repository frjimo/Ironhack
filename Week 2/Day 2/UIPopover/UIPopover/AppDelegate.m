//
//  AppDelegate.m
//  UIPopover
//
//  Created by Fran on 15/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *popOverController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIViewController *mainViewController = [[UIViewController alloc] init];
    mainViewController.view.backgroundColor = [UIColor yellowColor];
    mainViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Mostrar" style:UIBarButtonItemStylePlain target:self action:@selector(showPopover:)];
    
    UIViewController *presentedViewController = [[UIViewController alloc] init];
    presentedViewController.view.backgroundColor = [UIColor purpleColor];
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:mainViewController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)showPopover:(UIBarButtonItem *)buttonItem {
    UIViewController *presentedViewController = [[UIViewController alloc] init];
    presentedViewController.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [closeButton setTitle:@"Cerrar" forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(100, 100, 100, 40);
    [presentedViewController.view addSubview:closeButton];
    
    [closeButton addTarget:self action:@selector(closePopover) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.popOverController = [[UIPopoverController alloc] initWithContentViewController:presentedViewController];
    //La flecha del popOver sale morada
    self.popOverController.backgroundColor = presentedViewController.view.backgroundColor;
    self.popOverController.delegate = self;
    
    [self.popOverController presentPopoverFromBarButtonItem:buttonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)closePopover {
    [self.popOverController dismissPopoverAnimated:YES];
}


- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController{
    return NO;
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

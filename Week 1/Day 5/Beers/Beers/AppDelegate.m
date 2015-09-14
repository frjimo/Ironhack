//
//  AppDelegate.m
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "AppDelegate.h"
#import "Beer.h"
#import "Person.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Beer *beer1 = [[Beer alloc] beerWithName:@"estrella" color:@"amarillo" grade:6];
    Beer *beer2 = [[Beer alloc] beerWithName:@"moritz" color:@"amarillo" grade:3];
    
    
    
    Person *person1 = [[Person alloc]initWithName:@"Pepe"];
    Person *person2 = [[Person alloc]initWithName:@"Groucho"];
    
    Person *person3 = [[Person alloc] initWithName:@"Fran"];
    [person3 setAddress:@"6 de Junio"];
    [person3 setAge: 24];
    [person3 setMarried:false];
    
    //NSMutableArray *personas = [NSArray arrayWithObjects:person1,person2,person3, nil];
    NSMutableArray *personas = [NSMutableArray arrayWithArray:@[person1, person2, person3]];
    
    for (NSInteger i = 0; i<100; i++) {
        NSString * auxName = [NSString stringWithFormat:@"Persona %ld",(long)i];
        Person *person = [[Person alloc]initWithName:auxName];
        [personas addObject:person];
        
        NSLog(@"%@\n",person.description);
    }
    
    
    NSLog(@"%@", beer1.description);
    
    
    return YES;
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

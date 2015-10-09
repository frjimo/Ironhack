#import "AppDelegate.h"
#import "FakeRadarGenerator.h"
#import "CoreDataStack.h"
#import "RadarsViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) CoreDataStack *cds;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.cds = [[CoreDataStack alloc] initWithDatabaseFileName:@"radars.sqlite" andPersistenceType:NSSQLiteStoreType];
    
    // [[[FakeRadarGenerator alloc] init] generateRadarsInContext:self.cds.managedObjectContext];
    
    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
    RadarsViewController *vc = (RadarsViewController *)nav.topViewController;
    vc.managedObjectContext = self.cds.managedObjectContext;

    
    NSLog(@"🐤🐴 🌈🐴");
    
    return YES;
}

@end

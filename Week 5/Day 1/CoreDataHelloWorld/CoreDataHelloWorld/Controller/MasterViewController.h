//
//  MasterViewController.h
//  CoreDataHelloWorld
//
//  Created by Fran on 5/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end


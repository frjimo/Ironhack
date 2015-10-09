//
//  RadarsViewController+DFNSFetchResultsController.h
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 8/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "RadarsViewController.h"

@interface RadarsViewController (DFNSFetchResultsController)  <NSFetchedResultsControllerDelegate>

- (NSFetchedResultsController *)fetchedResultsController;


@end

//
//  RadarsViewController+DFNSFetchResultsController.h
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 8/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "IP4ViewController"

@interface RadarsViewController (DFNSFetchResultsController)  <NSFetchedResultsControllerDelegate>

- (NSFetchedResultsController *)fetchedResultsController;


@end

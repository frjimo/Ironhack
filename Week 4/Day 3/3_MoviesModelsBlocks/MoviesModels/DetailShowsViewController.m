//
//  DetailShowsViewController.m
//  MoviesModels
//
//  Created by Fran on 30/9/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import "DetailShowsViewController.h"

@interface DetailShowsViewController ()

@end

@implementation DetailShowsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelDetail.text = self.show.showDescription;
    self.imageDetail.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.show.posterURL]];
    
    
}

@end

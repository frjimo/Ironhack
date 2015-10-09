//
//  EditRadarViewController.m
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 6/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "EditRadarViewController.h"

@interface EditRadarViewController ()

@property (weak, nonatomic) IBOutlet UITextField *radarText;

@property (weak, nonatomic) IBOutlet UITextField *radarUser;


@end

@implementation EditRadarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.radar != nil) {
        self.radarText.text = self.radar.title;
        self.radarUser.text = self.radar.user;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    
    
    self.radar.title = self.radarText.text;
    self.radar.user = self.radarUser.text;
    
    NSManagedObjectContext *context = [self.radar managedObjectContext];
    
    NSError *error;
    [context save:&error];
    
    if (error != nil) {
        NSLog(@"OMG! %@", error);
        self.radar.user = @"error@error.com";
        [context save:&error];

    }
}

@end

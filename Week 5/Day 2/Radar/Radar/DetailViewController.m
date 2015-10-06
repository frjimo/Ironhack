//
//  DetailViewController.m
//  Radar
//
//  Created by Fran on 6/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *autorTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (strong, nonatomic) NSString *lastRadarUser;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.radar){
        self.lastRadarUser = self.radar.user;
        self.autorTextField.text = self.radar.user;
        self.descriptionTextField.text = self.radar.title;
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [self save];
}

- (void)save {
    self.radar.user = self.autorTextField.text;
    self.radar.title = self.descriptionTextField.text;
    NSManagedObjectContext *context = self.radar.managedObjectContext;
    
    NSError *error;
    [context save:&error];
    
    if (error !=nil){
        NSLog(@"Error");
        self.radar.user = self.lastRadarUser;
        [context save:&error];
    }
}


@end

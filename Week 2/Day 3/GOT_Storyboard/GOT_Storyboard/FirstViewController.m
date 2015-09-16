//
//  ViewController.m
//  GOT_Storyboard
//
//  Created by Fran on 16/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITextView *biographyTextfield;
@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;
@property (weak, nonatomic) IBOutlet UISegmentedControl *houseSegmentedControl;
@property (weak, nonatomic) IBOutlet UISlider *evilnessSlider;
@property (weak, nonatomic) IBOutlet UISwitch *lifeSwitch;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([segue.identifier isEqualToString:@"nextSegue"]) {
        SecondViewController *nextController;
        nextController = segue.destinationViewController;
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

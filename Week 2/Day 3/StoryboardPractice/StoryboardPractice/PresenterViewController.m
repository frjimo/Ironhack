//
//  PresentedViewController.m
//  StoryboardPractice
//
//  Created by Fran on 16/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "PresenterViewController.h"

@interface PresenterViewController ()

@end

@implementation PresenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue
//                 sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"nextSegue"]) {
//        ViewController *nextController;
//        nextController = segue.destinationViewController;
//    }
//}

- (void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = self.controllerColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(UIStoryboardSegue *)segue {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

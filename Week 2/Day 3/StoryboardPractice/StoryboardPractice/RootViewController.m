//
//  RootViewController.m
//  StoryboardPractice
//
//  Created by Fran on 16/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "RootViewController.h"
#import "PresenterViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.destinationViewController isKindOfClass:[PresenterViewController class]]){
//        PresenterViewController *nextViewController = segue.destinationViewController;
//        nextViewController.controllerColor = [UIColor purpleColor];
//    }
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([segue.identifier isEqualToString:@"nextSegue"]) {
        PresenterViewController *nextController;
        nextController = segue.destinationViewController;
        nextController.controllerColor = [UIColor purpleColor];
    }else if ([segue.identifier isEqualToString:@"modal"])
        NSLog(@"Modal");
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

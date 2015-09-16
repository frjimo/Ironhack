//
//  FirstViewController.m
//  XIBPractice
//
//  Created by Fran on 16/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"First View";
    // Do any additional setup after loading the view.
}
- (IBAction)buttonPressed:(UIButton *)sender {
    SecondViewController *secondViewController = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

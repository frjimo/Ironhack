//
//  FirstViewController.m
//  UINavigationController
//
//  Created by Fran on 15/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildButton];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
}

- (void)buildButton {
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 200, 100, 40);
    [button setTitle:@"Next" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(presentNextViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.title = @"First";
}

- (void)presentNextViewController {
    //UIViewController *nextController = [[UIViewController alloc] init];
    SecondViewController *nextController = [[SecondViewController alloc] init];
    //nextController.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:nextController animated:YES];
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

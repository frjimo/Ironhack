//
//  PresentedViewController.m
//  Game of Thrones App
//
//  Created by Fran on 14/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@property (strong, nonatomic) UIButton *dismissButton;

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.dismissButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.dismissButton.frame = CGRectMake(100, 100, 100, 100);
    [self.dismissButton setTitle:@"Cerrar" forState:UIControlStateNormal];
    
    [self.view addSubview:self.dismissButton];
    
    [self.dismissButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)dismiss {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
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

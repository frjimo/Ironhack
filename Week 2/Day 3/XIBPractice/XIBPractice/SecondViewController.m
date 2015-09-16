//
//  SecondViewController.m
//  XIBPractice
//
//  Created by Fran on 16/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Second View";
    UINib *viewNib = [UINib nibWithNibName:@"CustomView" bundle:[NSBundle mainBundle]];
    UIView *customView = [[viewNib instantiateWithOwner:self options:nil]lastObject];
    customView.frame = CGRectMake(10, 40, 200, 200);
    
    [self.view addSubview:customView];
    
}
- (IBAction)nextViewController:(UIButton *)sender {
    ThirdViewController *thirdViewController = [[ThirdViewController alloc]initWithNibName:@"DetailView" bundle:[NSBundle mainBundle]];
    
    [self.navigationController pushViewController:thirdViewController animated:YES];
    
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

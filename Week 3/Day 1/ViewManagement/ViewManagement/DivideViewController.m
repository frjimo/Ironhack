//
//  DivideViewController.m
//  ViewManagement
//
//  Created by Fran on 21/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "DivideViewController.h"

@interface DivideViewController ()

@end

@implementation DivideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Divide];

}

- (void)Divide {
    CGRect frame = CGRectMake(10.0, 50.0, 300.0, 300.0);
    CGRect part1;
    CGRect part2;
    CGRectDivide(frame, &part1, &part2, 100.0, CGRectMaxYEdge);
    
    UIView *view1 = [[UIView alloc] initWithFrame:frame];
    [view1 setBackgroundColor:[UIColor grayColor]];
    
    UIView *view2 = [[UIView alloc] initWithFrame:part1];
    [view2 setBackgroundColor:[UIColor orangeColor]];
    
    UIView *view3 = [[UIView alloc] initWithFrame:part2];
    [view3 setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
}

@end

//
//  SecondViewController.m
//  ViewManagement
//
//  Created by Fran on 21/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//
//http://code.tutsplus.com/tutorials/ios-fundamentals-frames-bounds-and-cggeometry--cms-21196
#import "UnionViewController.h"

@interface UnionViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *orangeView;

@end

@implementation UnionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self rectUnion];
}

- (void)rectUnion {
    CGRect red = CGRectMake(self.redView.frame.origin.x, self.redView.frame.origin.y, self.redView.frame.size.width, self.redView.frame.size.height);
    CGRect orange = CGRectMake(self.orangeView.frame.origin.x, self.orangeView.frame.origin.y, self.orangeView.frame.size.width, self.orangeView.frame.size.height);
    CGRect grayRect =  CGRectUnion(red, orange);
    
    UIView *grayView = [[UIView alloc]initWithFrame:grayRect];
    grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.redView];
    [self.view addSubview:self.orangeView];
    [self.view addSubview:grayView];
    [self.view sendSubviewToBack:grayView];
    
    [self.view bringSubviewToFront:self.orangeView]; 
}

//// CGRectUnion
//CGRect frame1 = CGRectMake(80.0, 100.0, 150.0, 240.0);
//CGRect frame2 = CGRectMake(140.0, 240.0, 120.0, 120.0);
//CGRect frame3 = CGRectUnion(frame1, frame2);
//
//UIView *view1 = [[UIView alloc] initWithFrame:frame1];
//[view1 setBackgroundColor:[UIColor redColor]];
//
//UIView *view2 = [[UIView alloc] initWithFrame:frame2];
//[view2 setBackgroundColor:[UIColor orangeColor]];
//
//UIView *view3 = [[UIView alloc] initWithFrame:frame3];
//[view3 setBackgroundColor:[UIColor grayColor]];
//
//[self.view addSubview:view3];
//[self.view addSubview:view2];
//[self.view addSubview:view1];


@end

//
//  TransformRotationViewController.m
//  ViewManagement
//
//  Created by Fran on 21/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "TransformRotationViewController.h"

#define degreesToRadians(x) (M_PI * (x)/ 180)

@interface TransformRotationViewController ()

@property (strong, nonatomic) UIView *blackView;
@property (strong, nonatomic) UIView *orangeView;

@end

@implementation TransformRotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self stepOne];
    //[self stepTwo];
    [self stepThree];
    


}

- (void)stepThree {
    CGRect blackFrame = CGRectMake(100.0, 120.0, 150.0, 180.0);
    self.blackView = [[UIView alloc] initWithFrame:blackFrame];
    [self.blackView setBackgroundColor:[UIColor blackColor]];
    self.blackView.transform = [self transformShear:_blackView.transform];
    [self.view addSubview:self.blackView];
    //CGAffineTransformMake(1.f, 0.f, 0.3f, 1.f, 0.f, 0.f);
}

- (void)stepTwo {
    [self addSubviewInset];
    //Rotate
    [self makeRotate];
    //Translate
    self.orangeView.transform = [self translate:self.orangeView.transform];
    
}


- (void)stepOne {
    [self addSubviewInset];
    //Rotate
    self.blackView.transform = [self rotate:self.blackView.transform];
    //Translate
    self.blackView.transform = [self translate:self.blackView.transform];
}

- (void)addSubviewInset{
    CGRect blackFrame = CGRectMake(50.0, 120.0, 150.0, 180.0);
    self.blackView = [[UIView alloc] initWithFrame:blackFrame];
    [self.blackView setBackgroundColor:[UIColor blackColor]];
    //[self.view addSubview:blackView];
    
    CGRect orangeFrame = CGRectInset(self.blackView.bounds, 10, 10);
    self.orangeView = [[UIView alloc]initWithFrame:orangeFrame];
    self.orangeView.backgroundColor = [UIColor orangeColor];
    //[self.view addSubview:orangeView];
    [self.blackView addSubview:self.orangeView];
    [self.view addSubview:self.blackView];
}


- (CGAffineTransform)rotate:(CGAffineTransform )transform{
    return CGAffineTransformRotate(transform ,degreesToRadians(45));
}

- (CGAffineTransform)translate:(CGAffineTransform )transform{
    return CGAffineTransformTranslate(transform , 100, 0);
}

- (void)makeRotate {
    self.orangeView.transform = CGAffineTransformMakeRotation(degreesToRadians(45));
}

- (CGAffineTransform)transformShear:(CGAffineTransform )transform{
    return CGAffineTransformMake(1.f, 0.f, -0.3f, 1.f, 0.f, 0.f);
}


@end

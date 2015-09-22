//
//  ThirdViewController.m
//  AutoLayoutBasic
//
//  Created by Fran on 22/9/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //------------------------------------------------------------------------------
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
//    view.translatesAutoresizingMaskIntoConstraints = NO;
//    view.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view];
//    
//    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10];
//    
//    NSLayoutConstraint *trailingConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-10];
//    
//    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:10];
//    
//    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
//    
//    [self.view addConstraints:@[leadingConstraint, trailingConstraint, topConstraint, bottomConstraint]];
    
    
//------------------------------------------------------------------------------
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    NSLayoutConstraint *leadingConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:10];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
    bottomConstraint.priority = 750;
    
    NSLayoutConstraint *greaterThanOrEqualBottomConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
    greaterThanOrEqualBottomConstraint.priority = 1000;
    
    NSLayoutConstraint *partialWidth = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0];
    
     [self.view addConstraints:@[leadingConstraint, partialWidth, topConstraint, bottomConstraint, greaterThanOrEqualBottomConstraint]];
    
    
//------------------------------------------------------------------------------
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
//    view.translatesAutoresizingMaskIntoConstraints = NO;
//    view.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view];
//
//    NSDictionary *metrics = @{
//                              @"leadingSpace": @10,
//                              @"trailingSpace": @10,
//                              @"topSpace": @10,
//                              @"bottomSpace": @10
//                              };
//    
//    NSDictionary * views = NSDictionaryOfVariableBindings(view);
//    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leadingSpace-[view]-trailingSpace-|" options:0 metrics:metrics views:views];
//    [self.view addConstraints:horizontalConstraints];
//    
//    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpace-[view]-bottomSpace-|" options:0 metrics:metrics views:views];
//    
//    [self.view addConstraints:verticalConstraints];

//------------------------------------------------------------------------------
    
//    UIView *leftView = [[UIView alloc] initWithFrame:CGRectZero];
//    leftView.translatesAutoresizingMaskIntoConstraints = NO;
//    leftView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:leftView];
//    
//    UIView *rightView = [[UIView alloc] initWithFrame:CGRectZero];
//    rightView.translatesAutoresizingMaskIntoConstraints = NO;
//    rightView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:rightView];
//    
//    NSDictionary *metrics = @{
//                              @"leadingSpace": @10,
//                              @"trailingSpace": @10,
//                              @"topSpace": @10,
//                              @"bottomSpace": @10,
//                              @"separation": @20
//                              };
//    
//    NSDictionary * views = NSDictionaryOfVariableBindings(leftView, rightView);
//    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leadingSpace-[leftView(==rightView)]-separation-[rightView]-trailingSpace-|" options:0 metrics:metrics views:views];
//    [self.view addConstraints:horizontalConstraints];
//    
//    //Peta
//    //NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpace-[leftView]-separation-[rightView]-bottomSpace-|" options:0 metrics:metrics views:views];
//    NSArray *leftVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpace-[leftView]-bottomSpace-|" options:0 metrics:metrics views:views];
//    [self.view addConstraints:leftVerticalConstraints];
//    
//    NSArray *rightVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpace-[rightView]-bottomSpace-|" options:0 metrics:metrics views:views];
//    [self.view addConstraints:rightVerticalConstraints];
    
    
//------------------------------------------------------------------------------
    
//    UIView *leftView = [[UIView alloc] initWithFrame:CGRectZero];
//    leftView.translatesAutoresizingMaskIntoConstraints = NO;
//    leftView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:leftView];
//    
//    UIView *rightView = [[UIView alloc] initWithFrame:CGRectZero];
//    rightView.translatesAutoresizingMaskIntoConstraints = NO;
//    rightView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:rightView];
//    
//    
//    NSDictionary * views = NSDictionaryOfVariableBindings(leftView, rightView);
//    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[leftView(==rightView)]-20-[rightView]-10-|" options:0 metrics:nil views:views];
//    [self.view addConstraints:horizontalConstraints];
//    
//    //Peta
//    //NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpace-[leftView]-separation-[rightView]-bottomSpace-|" options:0 metrics:metrics views:views];
//    NSArray *leftVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[leftView]-10-|" options:0 metrics:nil views:views];
//    [self.view addConstraints:leftVerticalConstraints];
//    
//    NSArray *rightVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[rightView]-10-|" options:0 metrics:nil views:views];
//    [self.view addConstraints:rightVerticalConstraints];
//
//    
}


@end

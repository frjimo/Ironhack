//
//  ViewController.m
//  Layers Exercise
//
//  Created by Fran on 23/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layerA = [CALayer layer];
    layerA.bounds = CGRectMake(0, 0, 150, 150);
    //layerA.anchorPoint = CGPointMake(0,0);
    layerA.position = CGPointMake(self.view.frame.size.width / 2 - 40, self.view.frame.size.height / 2);
    layerA.backgroundColor = [[UIColor redColor]CGColor];
    
    CALayer *layerB= [CALayer layer];
    layerB.bounds = CGRectMake(0, 0, 100, 200);
    layerB.anchorPoint = CGPointMake(0.3,0.8);
    layerB.position = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 + 10);
    layerB.backgroundColor = [[UIColor greenColor]CGColor];
    
    CALayer *layerC = [CALayer layer];
    layerC.bounds = CGRectMake(0, 0, 100, 220);
    layerC.anchorPoint = CGPointMake(0.7,1);
    layerC.position = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    layerC.backgroundColor = [[UIColor purpleColor]CGColor];

    
    [self.view.layer insertSublayer:layerA atIndex:2];
    [self.view.layer insertSublayer:layerB atIndex:1];
    [self.view.layer insertSublayer:layerC atIndex:0];
    
    
    CALayer *layerD = [CALayer layer];
    layerD.bounds = CGRectMake(0, 0, 20, 20);
    //layerD.anchorPoint = CGPointMake(0.7,1);
    layerD.position = CGPointMake(layerA.frame.size.width / 2, 20);
    
    UIImage *image = [UIImage imageNamed:@"Icon"];
    UIImageView *icon = [[UIImageView alloc]initWithImage:image];
    
    layerD.contents = (id)image.CGImage;
    [layerA insertSublayer:layerD atIndex:1];
    
}
@end

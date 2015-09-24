//
//  ViewController.m
//  Layers Exercise
//
//  Created by Fran on 23/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *tits;
@property (nonatomic, strong) UIImageView *work;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self exerciseOne];
    [self exerciseTwo];
    
}


- (void)exerciseTwo {
    CAScrollLayer *layer = [CAScrollLayer layer];
    
    layer.frame = CGRectMake(0, 0, self.view.frame.size.width * 2 , self.view.frame.size.height);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.scrollMode = kCAScrollHorizontally;
    
    self.tits.image = [UIImage imageNamed:@"tits"];
    self.work.image = [UIImage imageNamed:@"works"];
    self.tits.contentMode = UIViewContentModeScaleToFill;
    self.work.contentMode = UIViewContentModeScaleToFill;
    
//    
//    self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
//    self.imageView.image = [UIImage imageNamed:@"Abomi"];
//    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
//
    
    
    [self.view.layer addSublayer:layer];
    
}




- (void)exerciseOne {
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
    UIImage *image = [UIImage imageNamed:@"Icon"];
    layerD.bounds = CGRectMake(0, 0, image.size.width-15, image.size.height-15);
    //layerD.anchorPoint = CGPointMake(0.7,1);
    layerD.position = CGPointMake(layerA.frame.size.width / 2, 20);
    
    
    
    layerD.contents = (id)image.CGImage;
    [layerA insertSublayer:layerD atIndex:1];
}
@end

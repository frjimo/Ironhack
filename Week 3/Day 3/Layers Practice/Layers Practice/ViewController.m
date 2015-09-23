//
//  ViewController.m
//  Layers Practice
//
//  Created by Fran on 23/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self firstPractice];
    //[self secondPractice];
    [self thirdPractice];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)secondPractice {
    CALayer *layerA = [[CALayer alloc]init];
    //layerA.frame = CGRectMake(0, 0, 50, 50);
    layerA.bounds = CGRectMake(0, 0, 50, 50);
    layerA.anchorPoint = CGPointMake(1,0.5);
    layerA.position = CGPointMake(self.redView.frame.size.width, self.redView.frame.size.height / 2);
    layerA.backgroundColor = [[UIColor purpleColor]CGColor];
    
    CALayer *layerB = [CALayer layer];
    layerB.bounds = CGRectMake(0, 0, 50, 50);
    //layerB.anchorPoint = CGPointMake(0,0);
    layerB.position = CGPointMake(self.redView.frame.size.width / 2, self.redView.frame.size.height / 2);
    layerB.backgroundColor = [[UIColor yellowColor]CGColor];
    
    CALayer *layerC = [CALayer layer];
    layerC.bounds = CGRectMake(0, 0, 50, 50);
    layerC.anchorPoint = CGPointMake(0,0.5);
    layerC.position = CGPointMake(0, self.redView.frame.size.height / 2);
    layerC.backgroundColor = [[UIColor greenColor]CGColor];
    
    [self.redView.layer insertSublayer:layerA atIndex:0];
    [self.redView.layer insertSublayer:layerB atIndex:1];
    [self.redView.layer insertSublayer:layerC atIndex:2];
    
}

- (void)firstPractice {
    UIImage *image = [UIImage imageNamed:@"Abomi"];
    UIImageView *abomi = [[UIImageView alloc]initWithImage:image];
    
    self.redView.layer.backgroundColor = [[UIColor lightGrayColor] CGColor];
    self.redView.layer.cornerRadius = 20;
    self.redView.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.redView.layer.borderWidth = 6;
    self.redView.layer.shadowRadius = 24;
    self.redView.layer.shadowOpacity = 0.2;
    
    abomi.frame = self.redView.bounds;
    abomi.contentMode = UIViewContentModeScaleAspectFill;
    abomi.layer.cornerRadius = 20;
    abomi.layer.masksToBounds = YES;
    
    
    [self.redView addSubview:abomi];
}

- (void)thirdPractice {
    CALayer *layerB = [CALayer layer];
    layerB.bounds = CGRectMake(0, 0, 100, 100);
    //layerB.anchorPoint = CGPointMake(0,0);
    layerB.position = CGPointMake(self.redView.frame.size.width / 2, self.redView.frame.size.height / 2);
    layerB.backgroundColor = [[UIColor yellowColor]CGColor];
    
    UIImage *image = [UIImage imageNamed:@"Abomi"];
    UIImageView *abomi = [[UIImageView alloc]initWithImage:image];
    
    layerB.contents = (id)image.CGImage;
    [self.redView.layer insertSublayer:layerB atIndex:1];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  3_TransformsPractice
//
//  Created by Fran on 21/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

#define degreesToRadians(x) (M_PI * (x)/ 180)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *transformView;
@property (weak, nonatomic) IBOutlet UIView *transformView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeScale];
    [self makeRotate];
    
    self.transformView2.transform = [self scale:CGAffineTransformIdentity];
    self.transformView2.transform = [self rotate:self.transformView2.transform];
    
}

- (void)makeScale{
    self.transformView.transform = CGAffineTransformMakeScale(2, 2);
}

- (void)makeRotate {
    self.transformView.transform = CGAffineTransformMakeRotation(degreesToRadians(45));
}

- (CGAffineTransform)scale:(CGAffineTransform )transform{
    return CGAffineTransformScale(transform, 2, 2);
}

- (CGAffineTransform)rotate:(CGAffineTransform )transform{
    return CGAffineTransformRotate(transform ,degreesToRadians(45));
}



@end

//
//  ViewController.m
//  BasicAnimations
//
//  Created by Fran on 24/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *imageView;

@end

@implementation ViewController

- (CABasicAnimation *)animationX {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    basicAnimation.toValue = @0;
//    basicAnimation.duration = 5;
//    basicAnimation.fillMode = kCAFillModeForwards;
//    basicAnimation.removedOnCompletion = NO;
    
//    [self.imageView.layer addAnimation:basicAnimation forKey:@"opacity1Animation"];
    return basicAnimation;
}

- (CABasicAnimation *)animationY {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.toValue = @50;
//    basicAnimation.duration = 5;
//    basicAnimation.fillMode = kCAFillModeForwards;
//    basicAnimation.removedOnCompletion = NO;
    
//    [self.imageView.layer addAnimation:basicAnimation forKey:@"opacity2Animation"];
    return basicAnimation;
}

- (CABasicAnimation *)animationOpaque {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    basicAnimation.toValue = @0.1;
    basicAnimation.duration = 3;
    basicAnimation.fillMode = kCAFillModeForwards;
//    basicAnimation.removedOnCompletion = NO;
    
//    [self.imageView.layer addAnimation:basicAnimation forKey:@"opacity3Animation"];
    return basicAnimation;
}


- (void)viewDidLoad {
    [super viewDidLoad];

//    [self animationX];
//    [self animationY];
//    [self animationOpaque];
    
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = [NSArray arrayWithObjects:[self animationX], [self animationY], [self animationOpaque], nil];
    groupAnimation.duration = 5;
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.removedOnCompletion = NO;
    
    [self.imageView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];

    
}


@end

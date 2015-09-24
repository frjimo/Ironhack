//
//  ViewPractice 2.m
//  Animations Practice
//
//  Created by Fran on 24/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewPractice 2.h"

@interface ViewPractice_2 ()
@property (weak, nonatomic) IBOutlet UIView *imageView;
@property (nonatomic, assign) CGRect lastPosition;

@end

@implementation ViewPractice_2


- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.layer.cornerRadius = 30;
    self.imageView.backgroundColor = [UIColor redColor];
    //[self animations];
    
}

- (void)animations {
    self.imageView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    
    [UIView animateKeyframesWithDuration:10.25 delay:0 options:UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionRepeat animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.3 animations:^{
            CGPoint newPosition = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
            self.imageView.center = newPosition;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.15 animations:^{
            CGPoint newPosition = CGPointMake(self.view.frame.size.width, self.view.frame.size.height / 2);
            self.imageView.center = newPosition;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.15 animations:^{
            CGPoint newPosition = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height);
            self.imageView.center = newPosition;
        }];
        [UIView addKeyframeWithRelativeStartTime:1.2 relativeDuration:0.15 animations:^{
            CGPoint newPosition = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
            self.imageView.center = newPosition;
        }];
    } completion:nil];
}


//-------------------------------------------------------------------------------------------------

//- (IBAction)buttomPressed:(id)sender {
//    [UIView animateWithDuration:2 animations:^{
//        self.lastPosition = self.imageView.frame;
//        self.imageView.backgroundColor = [UIColor greenColor];
//        self.imageView.bounds = CGRectMake(self.imageView.bounds.origin.x, self.imageView.bounds.origin.y, self.imageView.bounds.size.width * 2, self.imageView.bounds.size.height * 2);
//    }completion:^(BOOL finished) {
//        [UIView animateWithDuration:2 animations:^{
//            self.imageView.frame = self.lastPosition;
//            //self.imageView.transform = self.imageView.bounds;
//            self.imageView.backgroundColor = [UIColor redColor];
//        }];
//    }];
//    
//}


//-------------------------------------------------------------------------------------------------

//
//- (IBAction)buttomPressed:(id)sender {
//    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
//        self.lastPosition = self.imageView.frame;
//        self.imageView.backgroundColor = [UIColor greenColor];
//        self.imageView.bounds = CGRectMake(self.imageView.bounds.origin.x, self.imageView.bounds.origin.y, self.imageView.bounds.size.width * 2, self.imageView.bounds.size.height * 2);
//    }completion:^(BOOL finished) {
//    }];
//    
//}

//-------------------------------------------------------------------------------------------------

//- (IBAction)buttomPressed:(id)sender {
//    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionAutoreverse animations:^{
//        self.lastPosition = self.imageView.frame;
//        self.imageView.backgroundColor = [UIColor greenColor];
//        self.imageView.bounds = CGRectMake(self.imageView.bounds.origin.x, self.imageView.bounds.origin.y, self.imageView.bounds.size.width * 2, self.imageView.bounds.size.height * 2);
//    }completion:^(BOOL finished) {
//                self.imageView.bounds = CGRectMake(self.imageView.bounds.origin.x, self.imageView.bounds.origin.y, self.imageView.bounds.size.width / 2, self.imageView.bounds.size.height / 2);
//                self.imageView.backgroundColor = [UIColor redColor];
//    }];
//    
//}

//-------------------------------------------------------------------------------------------------

- (IBAction)buttomPressed:(id)sender {
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear animations:^{
        self.lastPosition = self.imageView.frame;
        self.imageView.backgroundColor = [UIColor greenColor];
        self.imageView.bounds = CGRectMake(self.imageView.bounds.origin.x, self.imageView.bounds.origin.y, self.imageView.bounds.size.width * 2, self.imageView.bounds.size.height * 2);
    }completion:^(BOOL finished) {
    }];
    
}

@end

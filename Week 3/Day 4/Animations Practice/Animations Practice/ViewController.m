//
//  ViewController.m
//  Animations Practice
//
//  Created by Fran on 24/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self animations];
    
}

- (void)animations {
    NSString *name = [NSString stringWithFormat:@"win_"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for(int i = 0; i < 15; i++){
        UIImage *figure  = [UIImage imageNamed: [NSString stringWithFormat:@"%@%d",name,i+1]];
        [images insertObject:figure atIndex:i];
    }
    
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.imageView.animationImages = [images copy];
    self.imageView.animationDuration = 1;
    [self.imageView startAnimating];
    
}

- (IBAction)buttonPressed:(id)sender {
    
    [UIView animateWithDuration:1 delay:0.2 usingSpringWithDamping:0.4 initialSpringVelocity:0.4 options:0 animations:^{
        self.imageView.center = CGPointMake(self.imageView.center.x, self.imageView.center.y - 100);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0.44 options:0 animations:^{
            self.imageView.center = CGPointMake(self.imageView.center.x, self.imageView.center.y + 100);
        } completion:nil];
    }];
   
}


//- (void)animations {
//    NSString *name = [NSString stringWithFormat:@"win_"];
//    
//    NSMutableArray *images = [[NSMutableArray alloc] init];
//    for(int i = 0; i < 15; i++){
//        UIImage *figure  = [UIImage imageNamed: [NSString stringWithFormat:@"%@%d",name,i+1]];
//        [images insertObject:figure atIndex:i];
//    }
//    
//    self.imageView.contentMode = UIViewContentModeScaleToFill;
//    self.imageView.animationImages = [images copy];
//    self.imageView.animationDuration = 1;
//    [self.imageView startAnimating];
//}
@end

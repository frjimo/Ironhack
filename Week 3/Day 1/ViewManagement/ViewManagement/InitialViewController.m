//
//  ViewController.m
//  ViewManagement
//
//  Created by Fran on 21/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self one_initialSubviews];
    [self one_logCenter:_blueView];
}

- (void)one_initialSubviews {
    self.greenView.frame = CGRectInset(self.blueView.frame, 10, 10);
}

- (void)one_logCenter:(UIView *)view {
    NSLog(@"Centro: Posición x:%0.2f Posición y:%0.2f",view.center.x, view.center.y);
    NSLog(@"Centro: %@",NSStringFromCGPoint(view.center));
    
    //CGRect convertedFrame = [self.view1 convertRect:self.view1Subview.frame toView:self.view2];
    CGPoint convertedPoint = [self.blueView convertPoint:self.blueView.center toView:self.view];
    NSLog(@"Converted Point: %@",NSStringFromCGPoint(convertedPoint));
}

@end

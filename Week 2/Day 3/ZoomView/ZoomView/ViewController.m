//
//  ViewController.m
//  ZoomView
//
//  Created by Fran on 16/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//@property (weak,nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (IBAction)scrollViewDiChange:(UISlider *)slider {
    self.scrollView.zoomScale = slider.value;
    //Colocarlo en el centro
    self.imageView.center = CGPointMake(CGRectGetMidX(self.scrollView.frame), CGRectGetMidY(self.scrollView.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

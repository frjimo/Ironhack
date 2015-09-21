//
//  ViewController.m
//  2_ConversionPractice
//
//  Created by Fran on 21/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view1Subview;

@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view2Subview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect convertedFrame = [self.view1 convertRect:self.view1Subview.frame toView:self.view2];
    NSLog(@"Converted frame: %@",NSStringFromCGRect(convertedFrame));
    
    [self addSubviewInset:self.view1Subview];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)addSubviewInset:(UIView *)view{
    CGRect frame = CGRectInset(view.bounds, 30, 10);
    UIView *subView = [[UIView alloc]initWithFrame:frame];
    
    subView.backgroundColor = [UIColor redColor];
    [view addSubview:subView];
    
}

@end

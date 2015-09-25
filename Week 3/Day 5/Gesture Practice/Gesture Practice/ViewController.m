//
//  ViewController.m
//  Gesture Practice
//
//  Created by Fran on 25/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
}

- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture {
    [self createImage:[tapGesture locationInView:self.view]];
    
}

- (void)createImage:(CGPoint )location {
    CGRect frame = CGRectMake(0, 0, 200, 200);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.image = [UIImage imageNamed:@"vaderCat"];
    
    imageView.center =location;
    [self.view addSubview:imageView];
    
}

- (CGPoint)randomCenter {
    int x = arc4random() % (int)self.view.frame.size.width;
    int y = arc4random() % (int)self.view.frame.size.height;
    CGPoint center = CGPointMake(x, y);
    
    return center;
}


@end

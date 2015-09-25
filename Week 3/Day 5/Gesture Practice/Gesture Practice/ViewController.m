//
//  ViewController.m
//  Gesture Practice
//
//  Created by Fran on 25/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIView *currentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self initTap];
    [self initPinch];
    [self initRotation];
    [self initPan];
    

    
}


- (void)initTap {
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
}

- (void)initPinch {
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinchGesture:)];
    pinchRecognizer.delegate = self;
    [self.view addGestureRecognizer:pinchRecognizer];
}

- (void)initRotation {
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleRotationGesture:)];
    rotationRecognizer.delegate = self;
    [self.view addGestureRecognizer:rotationRecognizer];
}

- (void)initPan {
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    panGestureRecognizer.delegate = self;
    panGestureRecognizer.minimumNumberOfTouches = 1;
    panGestureRecognizer.maximumNumberOfTouches = 2;
    [self.view addGestureRecognizer:panGestureRecognizer];
}






- (void)handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    [self createImage:[tapGestureRecognizer locationInView:self.view]];
}


- (void)handlePinchGesture:(UIPinchGestureRecognizer *)pinchGestureRecognizer {
    if(pinchGestureRecognizer.state != UIGestureRecognizerStateChanged) {
        return;
    }
    self.currentView.transform = CGAffineTransformScale(self.currentView.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
    pinchGestureRecognizer.scale = 1;
}

-(void)handleRotationGesture:(UIRotationGestureRecognizer *)rotationGestureRecognizer {
    if(rotationGestureRecognizer.state != UIGestureRecognizerStateChanged) {
        return;
    }
    self.currentView.transform = CGAffineTransformRotate(self.currentView.transform, rotationGestureRecognizer.rotation);
    rotationGestureRecognizer.rotation = 0;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint translation = [panGestureRecognizer translationInView:self.view];
    if(panGestureRecognizer.state != UIGestureRecognizerStateChanged) {
        return;
    }
    self.currentView.center = CGPointMake(self.currentView.center.x + translation.x, self.currentView.center.y + translation.y);
    [panGestureRecognizer setTranslation:CGPointZero inView:self.view];
}


#pragma mark - UIGesture

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    self.currentView = [self imageViewBehindGestureRecognizerIfAny: gestureRecognizer];
    //UIImageView *imageView = [self imageViewBehindGestureRecognizerIfAny: gestureRecognizer];
    
    [self.view bringSubviewToFront:self.currentView];
    
    return self.currentView != nil;
}





- (UIView *)imageViewBehindGestureRecognizerIfAny:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint point = [gestureRecognizer locationInView:self.view];
    UIView *imageView = [self.view hitTest:point withEvent:nil];
    if(![imageView isKindOfClass: [UIImageView class]]){
        return nil;
    }
    return (UIImageView *)imageView;
}


- (void)createImage:(CGPoint )location {
    CGRect frame = CGRectMake(0, 0, 200, 200);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.image = [UIImage imageNamed:@"vaderCat"];
    
    imageView.center =location;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
}

- (CGPoint)randomCenter {
    int x = arc4random() % (int)self.view.frame.size.width;
    int y = arc4random() % (int)self.view.frame.size.height;
    CGPoint center = CGPointMake(x, y);
    
    return center;
}


@end

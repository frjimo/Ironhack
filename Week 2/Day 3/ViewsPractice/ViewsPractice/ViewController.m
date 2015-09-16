//
//  ViewController.m
//  ViewsPractice
//
//  Created by Fran on 16/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView * view1;
@property (strong, nonatomic) UIView * view2;
@property (strong, nonatomic) UIView * view3;

@property (strong, nonatomic) UIView * viewAlpha;

@property (strong, nonatomic) UIView * myView;

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self practice1];
    
    //[self practice2];
    
    //[self practice3];
    
    //[self practice4];
    
    //Recursividad con bloques
    //[self testRecursive];
    
    [self practice6];
    
    
    
    
}



//-----------------------------------------------------------------Practice 6----------------------------------------------------

- (void)practice6 {
    
    self.myView = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 300, 300)];
    self.myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.myView];
    
    UISlider *sliderAngle = [[UISlider alloc]initWithFrame:CGRectMake(200, 600, 300, 40)];
    [self.view addSubview:sliderAngle];
    sliderAngle.minimumValue = - M_PI_2;
    sliderAngle.maximumValue = M_PI_2;
    sliderAngle.value = 0;
    
    [sliderAngle addTarget:self action:@selector(angleChanged:) forControlEvents:UIControlEventValueChanged];
    
    UISlider *sliderScale = [[UISlider alloc]initWithFrame:CGRectMake(200, 700, 300, 40)];
    sliderScale.minimumValue = 0;
    sliderScale.maximumValue = 2;
    sliderScale.value = 1;
    
    [sliderScale addTarget:self action:@selector(scaleChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:sliderScale];
    
}

- (void)scaleChanged:(UISlider *)slider {
    self.myView.transform = CGAffineTransformMakeScale(slider.value, slider.value);
}

- (void)angleChanged:(UISlider *)slider {
    self.myView.transform = CGAffineTransformMakeRotation(slider.value);
}



//-----------------------------------------------------------------Practice 1----------------------------------------------------

- (void)practice1 {
    //[self buildViews];
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    //[self.view1 initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    view1.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    view1.backgroundColor = [UIColor redColor];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view2.center = CGPointMake(self.view.frame.size.width / 2 + 50, self.view.frame.size.height / 2 +50);
    
    view2.backgroundColor = [UIColor blueColor];
    
    
    [self.view addSubview:view2];
    [self.view addSubview:view1];
    
    [self.view bringSubviewToFront:view2];
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view3.center = CGPointMake(self.view.frame.size.width / 2 + 25, self.view.frame.size.height / 2 + 25);
    
    view3.backgroundColor = [UIColor greenColor];
    
    
    [self.view insertSubview:view3 aboveSubview:view2];
    
    view1.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    view2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    view3.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
}



- (void)buildViews:(UIView *)view value:(NSUInteger)value color:(UIColor *)color {
    UIView *viewAux = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    viewAux.center = CGPointMake(self.view.frame.size.width / 2 + value, self.view.frame.size.height / 2 +value);
    
    viewAux.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewAux];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)view1 {
    if (!_view1) {
        _view1 = [UIView new];
    }
    return _view1;
}

//-----------------------------------------------------------------Practice 2----------------------------------------------------


- (void)practice2 {
    
    
    UIImage *image = [UIImage imageNamed:@"targaryen1"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    imageView.backgroundColor = [UIColor redColor];
    imageView.image = image;
    
    [self.view addSubview:imageView];
    
    //imageView.contentMode = UIViewContentModeTop;
    //imageView.clipsToBounds= YES;
    //imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
}

//-----------------------------------------------------------------Practice 3----------------------------------------------------

- (void)practice3 {
    //[self buildViews];
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    //[self.view1 initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    view1.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    view1.backgroundColor = [UIColor redColor];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view2.center = CGPointMake(self.view.frame.size.width / 2 + 50, self.view.frame.size.height / 2 +50);
    
    view2.backgroundColor = [UIColor blueColor];
    
    
    [self.view addSubview:view2];
    [self.view addSubview:view1];
    
    [self.view bringSubviewToFront:view2];
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view3.center = CGPointMake(self.view.frame.size.width / 2 + 25, self.view.frame.size.height / 2 + 25);
    
    view3.backgroundColor = [UIColor greenColor];
    
    
    [self.view insertSubview:view3 aboveSubview:view1];
    
    view1.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    view2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    view3.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
    
    
    view3.alpha = 1;
    [UIView animateWithDuration:2.0 animations:^{
        view3.alpha = 0.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
            view3.alpha = 1;
        }];
    }];
    
    
    [UIView animateWithDuration:2.0 animations:^{
        view1.backgroundColor = [UIColor yellowColor];
    }];
}

//-----------------------------------------------------------------Practice 4----------------------------------------------------

- (void)practice4 {
    //[self buildViews];
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view1.backgroundColor = [UIColor redColor];
    
    [UIView animateWithDuration:2.0 animations:^{
        view1.center = CGPointMake(self.view.frame.size.width - self.view1.frame.size.width / 2, self.view.frame.origin.y);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
            view1.alpha = 1;
        }];
    }];
    
    
    [self.view addSubview:view1];
    
}

//-----------------------------------------------------------------Practice 5----------------------------------------------------


- (void)testRecursive {
    self.viewAlpha = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.viewAlpha.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    self.viewAlpha.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.viewAlpha];
    
    [self recursiveAlpha];
}


- (void)recursiveAlpha {
    
    __weak ViewController *weakself = self;
    
    [UIView animateWithDuration:1 animations:^{
        weakself.viewAlpha.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            weakself.viewAlpha.alpha = 1;
        } completion:^(BOOL finished) {
            [weakself recursiveAlpha];
        }];
    }];
}

@end

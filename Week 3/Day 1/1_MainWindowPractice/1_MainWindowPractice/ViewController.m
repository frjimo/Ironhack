//
//  ViewController.m
//  1_MainWindowPractice
//
//  Created by Fran on 21/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

static NSUInteger const padding = 8;
static NSUInteger const margin = 10;
static NSUInteger const heightUnit = 40;
static NSUInteger const initialUpperMargin = 40;

@interface ViewController ()

@property (assign, nonatomic) CGSize screenSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self draw];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)draw {
    
    
    CGRect viewGreenFrame = CGRectMake(0, 0, self.view.frame.size.width,200);
    UIView *firstView = [[UIView alloc]initWithFrame:viewGreenFrame];
    firstView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:firstView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"Add/Remove";
    nameLabel.frame =  CGRectMake(firstView.frame.origin.x, firstView.frame.origin.y, 150, 150);
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"Button" forState:UIControlStateNormal];
    button1.frame = CGRectMake(60, 60, 200, 40);
    
    [button1 addTarget:self action:@selector(drawView2) forControlEvents:UIControlEventTouchUpInside];
    
    
    [firstView addSubview:nameLabel];
    [firstView addSubview:button1];
}

- (void)drawView2{
    NSLog(@"Boton");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  ViewController.m
//  4_SubclassingViewPractice
//
//  Created by Fran on 21/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomView *customView = [[CustomView alloc]initWithFrame:self.view.frame title:@"CustomView"];
    customView.backgroundColor = [UIColor whiteColor];
    
    customView.title = @"Custom";
    
    [self.view addSubview:customView];
}



@end

//
//  RotatingNavigationController.m
//  GeoIp
//
//  Created by Diego Freniche Brito on 14/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "RotatingNavigationController.h"

@interface RotatingNavigationController ()

@end

@implementation RotatingNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end

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
    UIImage *figure;
    NSString *name = [NSString stringWithFormat:@"win_"];
    NSString *nameAux;
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for(int i = 0; i < 15; i++){
        nameAux = [NSString stringWithFormat:@"%@%d",name,i+1];
        figure  = [UIImage imageNamed: nameAux];
        [images insertObject:figure atIndex:i];
    }
    
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.imageView.animationImages = [images copy];
    self.imageView.animationDuration = 3;
    [self.imageView startAnimating];
}
@end
